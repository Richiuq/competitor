import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class RegistraPerfilPage extends StatefulWidget {
  const RegistraPerfilPage({Key? key}) : super(key: key);

  @override
  State<RegistraPerfilPage> createState() => _RegistraPerfilPageState();
}

class _RegistraPerfilPageState extends State<RegistraPerfilPage> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlContras = TextEditingController();
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlBox = TextEditingController();
  String? nombrePerfil;
  String? correoPerfil;
  String? contrasPerfil;
  String? boxPerfil;
  File? image;
  var nombreFotoPerfil;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> registrarPerfil(BuildContext context) async {
    nombrePerfil = controlNombre.text;
    contrasPerfil = controlContras.text;
    correoPerfil = controlCorreo.text;
    boxPerfil = controlBox.text;

    if (image != null && nombrePerfil != null && contrasPerfil != null) {
      await FirebaseStorage.instance
          .ref('$correoPerfil/${basename(image!.path)}')
          .putFile(image!)
          .then((taskSnapshot) {
        if (taskSnapshot.state == TaskState.success) {
          FirebaseStorage.instance
              .ref('$correoPerfil/${basename(image!.path)}')
              .getDownloadURL()
              .then((url) {
            final nombreFotoPerfil = url;
            FirebaseFirestore.instance
                .collection('BoxGimnasio')
                .doc(boxPerfil)
                .collection('Usuarios')
                .doc(correoPerfil)
                .set({
              'nombrePerfil': nombrePerfil,
              'contrasenaPerfil': contrasPerfil,
              'correoPerfil': correoPerfil,
              'boxPerfil': boxPerfil,
              'nombreFotoPerfil': nombreFotoPerfil,
            });
            FirebaseFirestore.instance
                .collection('BoxGimnasio')
                .doc(boxPerfil)
                .collection('Usuarios')
                .doc(correoPerfil)
                .collection('Foto')
                .doc('Foto1')
                .set({
              'nombreFoto': '1',
              'urlImage': '1',
            });
            FirebaseFirestore.instance
                .collection('BoxGimnasio')
                .doc(boxPerfil)
                .collection('Usuarios')
                .doc(correoPerfil)
                .collection('Video')
                .doc('Video1')
                .set({
              'nombreVideo': '1',
              'linkVideo': '1',
              'tipoVideo': '1',
              'cantRep': '1',
              'cantNoRep': '1',
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VentanaInicial(
                  usuarioIngresado: true,
                  usuario1FB: UsuarioFB(nombrePerfil, nombreFotoPerfil,
                      correoPerfil, contrasPerfil, boxPerfil, '', '0','0','0','0','0','0','Libras (lb)','35 lb'),
                  listFotosPerfil: [Foto('1', '1')],
                  listVideosPerfil: [Video('1', '1', '1', '1', '1','1','1')],
                ),
              ),
            );
            return url;
          }).catchError((onError) {
            print("Got Error $onError");
          });
        }
      });
      print('Ingreso Correcto');
    } else {
      print('Falta algún dato');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            //X REGISTRO ATLETA Y CHECK
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: colorVerde,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: Center(
                      child: Text(
                        'Registro de Atleta',
                        style: TextStyle(
                            color: colorVerde,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.check_box_rounded,
                    size: 30,
                    color: colorVerde,
                  ),
                ],
              ),
            ),
            //FOTO PERFIL Y TEXTO
            Column(
              children: [
                //FOTO
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pickImage();
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: colorVerde),
                      boxShadow: [shadowBoxesInicio],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: image != null
                          ? Image.file(
                              image!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            )
                          : Icon(
                              Icons.person,
                              color: colorVerde,
                              size: 100,
                            ),
                    ),
                  ),
                ),
                //TEXTO
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Cambia tú foto de perfil',
                    style: TextStyle(color: colorVerde, fontSize: 12),
                  ),
                ),
                //NOMBRE DE USUARIO
                Container(
                  margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Row(
                    children: [
                      Text(
                        'Nombre de usuario',
                        style: TextStyle(color: colorVerde, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorVerde),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: controlNombre,
                    maxLines: 1,
                  ),
                ),
                //CORREO
                Container(
                  margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Row(
                    children: [
                      Text(
                        'Correo',
                        style: TextStyle(color: colorVerde, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorVerde),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: controlCorreo,
                    maxLines: 1,
                  ),
                ),
                //CONTRASEÑA
                Container(
                  margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Row(
                    children: [
                      Text(
                        'Contraseña',
                        style: TextStyle(color: colorVerde, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorVerde),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: controlContras,
                    maxLines: 1,
                  ),
                ),
                //GIMNASIO/BOX
                Container(
                  margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Row(
                    children: [
                      Text(
                        'Gimnasio / Box',
                        style: TextStyle(color: colorVerde, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorVerde),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: controlBox,
                    maxLines: 1,
                  ),
                ),
                //BOTON REGISTRAR
                GestureDetector(
                  onTap: () {
                    setState(() {
                      registrarPerfil(context);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorVerde,
                    ),
                    child: Center(
                      child: Text(
                        'Registrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
