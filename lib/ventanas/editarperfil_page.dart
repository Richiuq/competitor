import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competitor/constantes.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage(
      {Key? key,
      required this.usuario1,
      required this.listFotosPerfil,
      required this.listVideosPerfil})
      : super(key: key);

  final UsuarioFB usuario1;
  final List<Foto> listFotosPerfil;
  final List<Video> listVideosPerfil;

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlContras = TextEditingController();
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlBox = TextEditingController();
  TextEditingController controlPresent = TextEditingController();
  String? nombrePerfil;
  String? correoPerfil;
  String? contrasPerfil;
  String? boxPerfil;
  String? presentPerfil;
  var nombreFotoPerfil;
  File? image;

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

  Future<void> editarenFBPerfil(BuildContext context) async {
    nombrePerfil = controlNombre.text;
    contrasPerfil = controlContras.text;
    correoPerfil = controlCorreo.text;
    boxPerfil = controlBox.text;
    presentPerfil = controlPresent.text;

    if (controlNombre.text == '') {
      nombrePerfil = widget.usuario1.nombrePerfil;
    } else {
      nombrePerfil = controlNombre.text;
    }
    if (controlContras.text == '') {
      contrasPerfil = widget.usuario1.contrasenaPerfil;
    } else {
      contrasPerfil = controlContras.text;
    }
    if (controlCorreo.text == '') {
      correoPerfil = widget.usuario1.correoPerfil;
    } else {
      correoPerfil = controlCorreo.text;
    }
    if (controlBox.text == '') {
      boxPerfil = widget.usuario1.boxPerfil;
    } else {
      boxPerfil = controlBox.text;
    }
    if (controlPresent.text == '') {
      presentPerfil = widget.usuario1.presentPerfil;
    } else {
      presentPerfil = controlPresent.text;
    }
    if (nombreFotoPerfil == null) {
      nombreFotoPerfil = widget.usuario1.nombreFotoPerfil;
    }

    if (image != null) {
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
              'presentPerfil': presentPerfil,
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PerfilUsuarioPage(
                    usuario1FB: UsuarioFB(nombrePerfil, nombreFotoPerfil, correoPerfil, contrasPerfil, boxPerfil, presentPerfil, '0','0','0','0','0','0','0','0'),
                    listFotosPerfil: widget.listFotosPerfil,
                    listVideosPerfil: widget.listVideosPerfil),
              ),
            );
            return url;
          }).catchError((onError) {
            print("Got Error $onError");
          });
        }
      });
    } else {
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
        'presentPerfil': presentPerfil,
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PerfilUsuarioPage(
              usuario1FB: UsuarioFB(nombrePerfil, nombreFotoPerfil, correoPerfil, contrasPerfil, boxPerfil, presentPerfil, '0','0','0','0','0','0','0','0'),
              listFotosPerfil: widget.listFotosPerfil,
              listVideosPerfil: widget.listVideosPerfil),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //X EDITAR PERFIL Y CHECK
          Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.close,
                  size: 30,
                  color: colorVerde,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(70, 0, 70, 0),
                  child: Center(
                    child: Text(
                      'Editar perfil',
                      style: TextStyle(
                          color: colorVerde,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      editarenFBPerfil(context);
                    });
                  },
                  child: Icon(
                    Icons.check_box_rounded,
                    size: 30,
                    color: colorVerde,
                  ),
                ),
              ],
            ),
          ),
          //EJE
          Container(
            height: 700,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //FOTO PERFIL
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pickImage();
                      });
                    },
                    child: Container(
                      height: 150,
                      width: 150,
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
                            : Image.network(
                                '${widget.usuario1.nombreFotoPerfil}',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Cambia tú foto de perfil',
                      style: TextStyle(color: colorVerde, fontSize: 12),
                    ),
                  ),
                  //NOMBRE
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Row(
                      children: [
                        Text(
                          'Nombre',
                          style: TextStyle(color: colorVerde, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colorVerde),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: controlNombre,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '${widget.usuario1.nombrePerfil}',
                      ),
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
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colorVerde),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: controlContras,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '${widget.usuario1.contrasenaPerfil}',
                      ),
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
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colorVerde),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: controlCorreo,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '${widget.usuario1.correoPerfil}',
                      ),
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
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colorVerde),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: controlBox,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '${widget.usuario1.boxPerfil}',
                      ),
                    ),
                  ),
                  //PRESENTACION
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Row(
                      children: [
                        Text(
                          'Presentación',
                          style: TextStyle(color: colorVerde, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  //EDITAR PRESEN
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: colorVerde),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: controlPresent,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '${widget.usuario1.presentPerfil}',
                      ),
                    ),
                  ),
                  //PESOS MAXIMOS
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Row(
                      children: [
                        Text(
                          'Pesos Máximos',
                          style: TextStyle(color: colorVerde, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  //EDITAR PESOS MAXIMOS
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                    height: 100,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: colorVerde),
                                    color: colorVerde,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Clean & Jerk',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: colorVerde),
                                    color: colorVerde,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Snatch',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: colorVerde),
                                    color: colorVerde,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Clean',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: colorVerde),
                                    color: colorVerde,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'FrontSquat',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: colorVerde),
                                    color: colorVerde,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'BackSquat',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: colorVerde),
                                    color: colorVerde,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Deadlift',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
