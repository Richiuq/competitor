import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/elegirporcentaje_page.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:competitor/widgets/elergirpeso_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:competitor/constantes.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart';

class DialogSubeVideoRM extends StatefulWidget {
  const DialogSubeVideoRM(
      {Key? key,
      required this.videoUpload,
      required this.usuario1FB,
      required this.listFotosPerfil,
      required this.listVideosPerfil})
      : super(key: key);

  final File videoUpload;
  final UsuarioFB usuario1FB;
  final List<Foto> listFotosPerfil;
  final List<Video> listVideosPerfil;

  @override
  State<DialogSubeVideoRM> createState() => _DialogSubeVideoRMState();
}

class _DialogSubeVideoRMState extends State<DialogSubeVideoRM> {
  VideoPlayerController? _controller;
  TextEditingController controlPesoEleg = TextEditingController();
  String selectTipoMov = '';
  String dropdownValue = 'Libras';
  List<Video> listVideosPerfilUpload = [];

  @override
  void initState() {
    _controller = VideoPlayerController.file(
      widget.videoUpload,
    );
    _controller!.initialize();
    _controller!.setLooping(true);
    _controller!.play();
    listVideosPerfilUpload = widget.listVideosPerfil;
    listVideosPerfilUpload.sort((b, a) {
      return (a.nombreVideo!).compareTo(b.nombreVideo!);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: Container(
        height: 600,
        child: Column(
          children: [
            //TEXTO SUBE TU VIDEO
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border.all(color: colorVerde),
                color: colorVerde,
              ),
              child: Center(
                  child: Text(
                'SUBE TÚ VIDEO',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
            //KILOS O LIBRAS DEL PESO
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Peso : ',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: colorVerde),
                    ),
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: controlPesoEleg,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: colorVerde,
                        size: 20,
                      ),
                      elevation: 16,
                      style: TextStyle(color: colorVerde),
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: <String>[
                        'Libras',
                        'Kilos',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            //TIPO DE MOVIMIENTO
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectTipoMov = 'Clean & Jerk';
                      print(selectTipoMov);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                      color: selectTipoMov == 'Clean & Jerk'
                          ? colorVerde
                          : Colors.white,
                    ),
                    child: Text(
                      'Clean & Jerk',
                      style: TextStyle(
                          fontSize: 10,
                          color: selectTipoMov == 'Clean & Jerk'
                              ? Colors.white
                              : colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectTipoMov = 'Snatch';
                      print(selectTipoMov);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                      color:
                          selectTipoMov == 'Snatch' ? colorVerde : Colors.white,
                    ),
                    child: Text(
                      'Snatch',
                      style: TextStyle(
                          fontSize: 10,
                          color: selectTipoMov == 'Snatch'
                              ? Colors.white
                              : colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectTipoMov = 'Clean';
                      print(selectTipoMov);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                      color:
                          selectTipoMov == 'Clean' ? colorVerde : Colors.white,
                    ),
                    child: Text(
                      'Clean',
                      style: TextStyle(
                          fontSize: 10,
                          color: selectTipoMov == 'Clean'
                              ? Colors.white
                              : colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectTipoMov = 'Deadlift';
                      print(selectTipoMov);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                      color: selectTipoMov == 'Deadlift'
                          ? colorVerde
                          : Colors.white,
                    ),
                    child: Text(
                      'Deadlift',
                      style: TextStyle(
                          fontSize: 10,
                          color: selectTipoMov == 'Deadlift'
                              ? Colors.white
                              : colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectTipoMov = 'BackSquat';
                      print(selectTipoMov);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                      color: selectTipoMov == 'BackSquat'
                          ? colorVerde
                          : Colors.white,
                    ),
                    child: Text(
                      'BackSquat',
                      style: TextStyle(
                          fontSize: 10,
                          color: selectTipoMov == 'BackSquat'
                              ? Colors.white
                              : colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectTipoMov = 'FrontSquat';
                      print(selectTipoMov);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                      color: selectTipoMov == 'FrontSquat'
                          ? colorVerde
                          : Colors.white,
                    ),
                    child: Text(
                      'FrontSquat',
                      style: TextStyle(
                          fontSize: 10,
                          color: selectTipoMov == 'FrontSquat'
                              ? Colors.white
                              : colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            //VIDEO
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.all(5),
              child: AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ingresaVideo(context);
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: colorVerde,
                ),
                height: 30,
                width: 100,
                child: Text(
                  'Aceptar',
                  style: botoniniciaStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> ingresaVideo(BuildContext context) async {
    await FirebaseStorage.instance
        .ref('${widget.usuario1FB.correoPerfil}/${basename(widget.videoUpload.path)}')
        .putFile(widget.videoUpload)
        .then((taskSnapshot) {
      if (taskSnapshot.state == TaskState.success) {
        FirebaseStorage.instance
            .ref('${widget.usuario1FB.correoPerfil}/${basename(widget.videoUpload.path)}')
            .getDownloadURL()
            .then((url) {
          final nombreVideoPerfil = url;
          Video videoAgregada = Video('${DateTime.now()}', nombreVideoPerfil,'0','0',selectTipoMov, controlPesoEleg.text,dropdownValue);
          listVideosPerfilUpload.insert(0, videoAgregada);
          FirebaseFirestore.instance
              .collection('BoxGimnasio')
              .doc(widget.usuario1FB.boxPerfil)
              .collection('Usuarios')
              .doc(widget.usuario1FB.correoPerfil)
              .collection('Video')
              .doc()
              .set({
            'nombreVideo': '${DateTime.now()}',
            'linkVideo': nombreVideoPerfil,
            'cantRep': '0',
            'cantNoRep': '0',
            'tipoVideo': selectTipoMov,
            'pesoVideo': controlPesoEleg.text,
            'lbkgVideo': dropdownValue,
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PerfilUsuarioPage(
                  usuario1FB: widget.usuario1FB,
                  listFotosPerfil: widget.listFotosPerfil,
                  listVideosPerfil: listVideosPerfilUpload),
            ),
          );
          return url;
        }).catchError((onError) {
          print("Got Error $onError");
        });
      }
    });
  }
}


