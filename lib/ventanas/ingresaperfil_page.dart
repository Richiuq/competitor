import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/registraperfil_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class IngresaPerfilPage extends StatefulWidget {
  const IngresaPerfilPage({Key? key}) : super(key: key);

  @override
  _IngresaPerfilPageState createState() => _IngresaPerfilPageState();
}

class _IngresaPerfilPageState extends State<IngresaPerfilPage> {
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  String? correoPerfil;
  List<Foto> listFotosPerfil = [];
  List<Video> listVideoPerfil = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        height: 400,
        child: Column(
          children: [
            //INICIA SESION TITULO
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: Text(
                'Inicia sesión',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //CUADRO CORREO
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: colorVerde),
                color: Colors.white,
              ),
              child: TextField(
                controller: controlCorreo,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: ' Correo electrónico',
                ),
              ),
            ),
            //CUADRO CONTRASEÑA
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: colorVerde),
                color: Colors.white,
              ),
              child: TextField(
                controller: controlPass,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: ' Contraseña',
                ),
              ),
            ),
            //RECUPERAR CONTRASEÑA NO TIENE LINK AUN
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text(
                'Recuperar Contraseña',
                style: textolinkStyle,
              ),
            ),
            //INGRESA USUARIO
            GestureDetector(
              onTap: () {
                setState(() {
                  ingresaUsuario();
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 50, 10, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [shadowBoxesInicio],
                  color: colorVerde,
                ),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'GO!',
                      style: botoniniciaStyle,
                    ),
                  ],
                ),
              ),
            ),
            //REGISTRA UN USUARIO
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistraPerfilPage(),
                    ),
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No tienes una cuenta?',
                      style: TextStyle(fontSize: 10, color: colorVerde),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Regístrate',
                      style: TextStyle(fontSize: 12, color: colorVerde),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ingresaUsuario() {
    correoPerfil = controlCorreo.text;

    FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        FirebaseFirestore.instance
            .collection('BoxGimnasio')
            .doc(result.get('nombreBox'))
            .collection('Usuarios')
            .get()
            .then((querySnapshot2) {
          querySnapshot2.docs.forEach((result2) {
            if (correoPerfil == result2.get('correoPerfil')) {
              print(result2.get('correoPerfil'));
              UsuarioFB userPerfil = UsuarioFB(
                result2.get('nombrePerfil'),
                result2.get('nombreFotoPerfil'),
                result2.get('correoPerfil'),
                result2.get('contrasenaPerfil'),
                result2.get('boxPerfil'),
                result2.get('presentPerfil'),
                result2.get('pesoCleanJerk'),
                result2.get('pesoSnatch'),
                result2.get('pesoClean'),
                result2.get('pesoDeadlift'),
                result2.get('pesoBackSquat'),
                result2.get('pesoFrontSquat'),
                result2.get('chosenValueTD'),
                result2.get('chosenValueTB'),
              );
              FirebaseFirestore.instance
                  .collection('BoxGimnasio')
                  .doc(result.get('nombreBox'))
                  .collection('Usuarios')
                  .doc(correoPerfil)
                  .collection('Foto')
                  .get()
                  .then((querySnapshot3) {
                querySnapshot3.docs.forEach((result3) {
                  Foto fotosPerfil = Foto(
                    result3.get('nombreFoto'),
                    result3.get('urlImage'),
                  );
                  listFotosPerfil.add(fotosPerfil);
                });
              });
              FirebaseFirestore.instance
                  .collection('BoxGimnasio')
                  .doc(result.get('nombreBox'))
                  .collection('Usuarios')
                  .doc(correoPerfil)
                  .collection('Video')
                  .get()
                  .then((querySnapshot4) {
                querySnapshot4.docs.forEach((result4) {
                  Video videosPerfil = Video(
                    result4.get('nombreVideo'),
                    result4.get('linkVideo'),
                    result4.get('cantRep'),
                    result4.get('cantNoRep'),
                    result4.get('tipoVideo'),
                    result4.get('pesoVideo'),
                    result4.get('lbkgVideo'),
                  );
                  listVideoPerfil.add(videosPerfil);
                });
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VentanaInicial(
                    usuarioIngresado: true,
                    usuario1FB: userPerfil,
                    listFotosPerfil: listFotosPerfil,
                    listVideosPerfil: listVideoPerfil,
                  ),
                ),
              );
              print('INGRESADO CORRECTAMENTE');
            }
          });
        });
      });
    });
  }
}
