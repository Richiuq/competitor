import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/boxcomunidad_page.dart';
import 'package:competitor/ventanas/comunidad_page.dart';
import 'package:competitor/ventanas/editarperfil_page.dart';
import 'package:competitor/ventanas/listaboxcomunidad_page.dart';
import 'package:competitor/ventanas/pantallavideo_page.dart';
import 'package:competitor/widgets/botonaceptar.dart';
import 'package:competitor/widgets/botonfotoaceptar.dart';
import 'package:competitor/widgets/botonvideoaceptar.dart';
import 'package:competitor/widgets/cuadrormperfil.dart';
import 'package:competitor/widgets/dialogsubevideorm.dart';
import 'package:competitor/widgets/fotodialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class PerfilUsuarioPage extends StatefulWidget {
  const PerfilUsuarioPage(
      {Key? key,
      required this.usuario1FB,
      required this.listFotosPerfil,
      required this.listVideosPerfil})
      : super(key: key);

  final UsuarioFB usuario1FB;
  final List<Foto> listFotosPerfil;
  final List<Video> listVideosPerfil;

  @override
  _PerfilUsuarioPageState createState() => _PerfilUsuarioPageState();
}

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  File? image;
  File? video;
  ClosedCaptionFile? imageCaption;
  List<Foto> listFotosPerfilUpload = [];
  List<Video> listVideosPerfilUpload = [];
  VideoPlayerController? _controllerCJ,
      _controllerSN,
      _controllerC,
      _controllerDL,
      _controllerBS,
      _controllerFS;
  String? fotoLink;
  List<UsuarioFB> usuariosBox = [];
  List<Foto> listFotosBox = [];

  Widget gridFotosFirebase(String urlImage, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (urlImage.contains('MOV')) {
            showDialog(
                context: context,
                builder: (context) {
                  return BotonVideoAceptar(
                    videoUpload: urlImage,
                  );
                });
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return FotoDialog(
                    fotoPress: urlImage,
                    onPress: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                  );
                });
          }
        });
      },
      child: urlImage.contains('MOV')
          ? Container(
              decoration: BoxDecoration(boxShadow: [shadowBoxesInicio]),
              alignment: Alignment.center,
              child: Icon(
                Icons.play_circle_fill,
                size: 50,
                color: Colors.white,
              ),
            )
          : urlImage == '1'
              ? Text('')
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('$urlImage'),
                    ),
                  ),
                ),
    );
  }

  @override
  void initState() {
    listFotosPerfilUpload = widget.listFotosPerfil;
    listFotosPerfilUpload.sort((b, a) {
      return (a.nombreFoto!).compareTo(b.nombreFoto!);
    });
    listVideosPerfilUpload = widget.listVideosPerfil;
    listVideosPerfilUpload.sort((b, a) {
      return (a.nombreVideo!).compareTo(b.nombreVideo!);
    });
    for (var i = 0; i < listVideosPerfilUpload.length; i++) {
      if (listVideosPerfilUpload[i].tipoVideo == 'Clean & Jerk') {
        _controllerCJ = VideoPlayerController.network(
          '${listVideosPerfilUpload[i].linkVideo}',
        );
        _controllerCJ!.initialize();
        _controllerCJ!.setLooping(false);
        _controllerCJ!.play();
      }
      if (listVideosPerfilUpload[i].tipoVideo == 'Snatch') {
        _controllerSN = VideoPlayerController.network(
          '${listVideosPerfilUpload[i].linkVideo}',
        );
        _controllerSN!.initialize();
        _controllerSN!.setLooping(false);
        _controllerSN!.play();
      }
      if (listVideosPerfilUpload[i].tipoVideo == 'Clean') {
        _controllerC = VideoPlayerController.network(
          '${listVideosPerfilUpload[i].linkVideo}',
        );
        _controllerC!.initialize();
        _controllerC!.setLooping(false);
        _controllerC!.play();
      }
      if (listVideosPerfilUpload[i].tipoVideo == 'Deadlift') {
        _controllerDL = VideoPlayerController.network(
          '${listVideosPerfilUpload[i].linkVideo}',
        );
        _controllerDL!.initialize();
        _controllerDL!.setLooping(false);
        _controllerDL!.play();
      }
      if (listVideosPerfilUpload[i].tipoVideo == 'BackSquat') {
        _controllerBS = VideoPlayerController.network(
          '${listVideosPerfilUpload[i].linkVideo}',
        );
        _controllerBS!.initialize();
        _controllerBS!.setLooping(false);
        _controllerBS!.play();
      }
      if (listVideosPerfilUpload[i].tipoVideo == 'FrontSquat') {
        _controllerFS = VideoPlayerController.network(
          '${listVideosPerfilUpload[i].linkVideo}',
        );
        _controllerFS!.initialize();
        _controllerFS!.setLooping(false);
        _controllerFS!.play();
      }
    }
    super.initState();
  }

  Future<String?> buscarFoto() async {
    await FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .doc(widget.usuario1FB.boxPerfil)
        .get()
        .then((querySnapshot) {
      fotoLink = querySnapshot.get('nombreFotoBox');
      return fotoLink;
    });
  }

  Future<void> buscarBox(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .doc(widget.usuario1FB.boxPerfil)
        .get()
        .then((querySnapshot) {
      fotoLink = querySnapshot.get('nombreFotoBox');
      String nombreBox = querySnapshot.get('nombreBox');
      String ubicacionBox = querySnapshot.get('ubicacionBox');

      FirebaseFirestore.instance
          .collection('BoxGimnasio')
          .doc(widget.usuario1FB.boxPerfil)
          .collection('Usuarios')
          .snapshots()
          .listen((event) {
        usuariosBox = event.docs
            .map((e) => UsuarioFB(
                e['nombrePerfil'],
                e['nombreFotoPerfil'],
                e['correoPerfil'],
                e['contrasenaPerfil'],
                e['boxPerfil'],
                e['presentPerfil'],
                e['pesoCleanJerk'],
                e['pesoSnatch'],
                e['pesoClean'],
                e['pesoDeadlift'],
                e['pesoBackSquat'],
                e['pesoFrontSquat'],
                e['chosenValueTD'],
                e['chosenValueTB'],
        )).toList();
      });

      BoxGimnasioFB boxFB = BoxGimnasioFB(nombreBox, fotoLink, ubicacionBox);

      FirebaseFirestore.instance
          .collection('BoxGimnasio')
          .doc(widget.usuario1FB.boxPerfil)
          .collection('Fotos')
          .snapshots()
          .listen((event) {
        listFotosBox = event.docs
            .map((e) => Foto(
            e['nombreFoto'],
            e['urlImage'],))
            .toList();
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BoxComunidadPage(
            usuario1: widget.usuario1FB,
            box1: boxFB,
            usuariosBox: usuariosBox,
            listFotosBox: listFotosBox,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controllerCJ!.dispose();
    _controllerSN!.dispose();
    _controllerC!.dispose();
    _controllerDL!.dispose();
    _controllerBS!.dispose();
    _controllerFS!.dispose();
    super.dispose();
  }

  Future pickVideo(BuildContext context) async {
    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (video == null) return;
      final videoTemporary = File(video.path);
      setState(() {
        this.video = videoTemporary;
      });

      showDialog(
          context: context,
          builder: (context) {
            return DialogSubeVideoRM(
              videoUpload: videoTemporary,
              listVideosPerfil: listVideosPerfilUpload,
              listFotosPerfil: listFotosPerfilUpload,
              usuario1FB: widget.usuario1FB,
            );
          });
/*      await FirebaseStorage.instance
          .ref('${widget.usuario1FB.correoPerfil}/${basename(video.path)}')
          .putFile(videoTemporary)
          .then((taskSnapshot) {
        if (taskSnapshot.state == TaskState.success) {
          FirebaseStorage.instance
              .ref('${widget.usuario1FB.correoPerfil}/${basename(video.path)}')
              .getDownloadURL()
              .then((url) {
            final nombreVideoPerfil = url;
            Video videoAgregada = Video('${DateTime.now()}', nombreVideoPerfil,'0','0','Clean & Jerk');
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
              'tipoVideo': 'Clean & Jerk',
            });
            showDialog(
                context: context,
                builder: (context) {
                  return BotonVideoAceptar(
                    videoUpload: nombreVideoPerfil,
                  );
                });
            return url;
          }).catchError((onError) {
            print("Got Error $onError");
          });
        }
      });*/
    } on PlatformException catch (e) {
      print('Failed to pick video: $e');
    }
  }

  Future pickImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });

      await FirebaseStorage.instance
          .ref('${widget.usuario1FB.correoPerfil}/${basename(image.path)}')
          .putFile(imageTemporary)
          .then((taskSnapshot) {
        if (taskSnapshot.state == TaskState.success) {
          FirebaseStorage.instance
              .ref('${widget.usuario1FB.correoPerfil}/${basename(image.path)}')
              .getDownloadURL()
              .then((url) {
            final nombreFotoPerfil = url;
            Foto fotoAgregada = Foto('${DateTime.now()}', '$nombreFotoPerfil');
            //listFotosPerfilUpload.add(fotoAgregada);
            listFotosPerfilUpload.insert(0, fotoAgregada);
            FirebaseFirestore.instance
                .collection('BoxGimnasio')
                .doc(widget.usuario1FB.boxPerfil)
                .collection('Usuarios')
                .doc(widget.usuario1FB.correoPerfil)
                .collection('Foto')
                .doc('Foto1')
                .delete();
            FirebaseFirestore.instance
                .collection('BoxGimnasio')
                .doc(widget.usuario1FB.boxPerfil)
                .collection('Usuarios')
                .doc(widget.usuario1FB.correoPerfil)
                .collection('Foto')
                .doc()
                .set({
              'nombreFoto': '${DateTime.now()}',
              'urlImage': nombreFotoPerfil,
            });
            listFotosPerfilUpload
                .removeWhere((element) => element.nombreFoto == '1');
            return url;
          }).catchError((onError) {
            print("Got Error $onError");
          });
        }
      });
      showDialog(
          context: context,
          builder: (context) {
            return BotonFotoAceptar(
              onPress: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              fotoUpload: imageTemporary,
            );
          });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          //MENUS SUPERIORES (RM COMPETITOR/ICONO 3 LINEAS)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 40,
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorVerde),
                  boxShadow: [shadowBoxesInicio],
                  color: colorVerde,
                ),
                child: widget.usuario1FB.correoPerfil == '1'
                    ? Text(
                        'RM Competitor',
                        style: titulormcompStyle2,
                      )
                    : Text(
                        '${widget.usuario1FB.correoPerfil}',
                        style: titulormcompStyle2,
                      ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorVerde),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComunidadPage(
                            usuario1: widget.usuario1,
                            boxes: widget.boxes,
                          ),
                        ),
                      );*/
                    });
                  },
                  child: Icon(
                    Icons.people_alt_rounded,
                    color: colorVerde,
                    size: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorVerde),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListaBoxComunidadPage(
                            usuario1: widget.usuario1,
                            boxes: widget.boxes,
                          ),
                        ),
                      );*/
                    });
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: colorVerde,
                    size: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorVerde),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VentanaInicial(
                            usuario1: widget.usuario1,
                            boxes: widget.boxes,
                            usuarioIngresado: true,
                          ),
                        ),
                      );*/
                    });
                  },
                  child: Icon(
                    Icons.view_headline,
                    color: colorVerde,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          //FOTO PERFIL/NOMBRE/TEXTO/INFO PERFIL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //FOTO PERFIL/NOMBRE/TEXTO
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //FOTO/SEG
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //FOTO PERFIL
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: colorVerde),
                              boxShadow: [shadowBoxesInicio],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                '${widget.usuario1FB.nombreFotoPerfil}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //SEGUIDORES
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '150',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Seg.',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Text(
                                  'Sig.',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //NOMBRE
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        '${widget.usuario1FB.nombrePerfil}',
                        style: TextStyle(
                            fontSize: 20,
                            color: colorVerde,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //PRESENTACION
                    Container(
                      height: 45,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        '${widget.usuario1FB.presentPerfil}',
                        style: TextStyle(fontSize: 10, color: colorVerde),
                      ),
                    )
                  ],
                ),
              ),
              //INFO PERFIL
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.0),
                  ),
                  border: Border.all(color: colorVerde),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  height: 210,
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TOTAL OLIMPICO RANKING
                      Text(
                        //${int.parse(widget.usuario1.pesoCleanJerk)}
                        '+RM 300 kg',
                        style: TextStyle(
                            color: colorVerde,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      //RANKING DEL BOX
                      Row(
                        children: [
                          Container(
                            width: 70,
                            child: Text(
                              'Ranking en\nGimnasio',
                              style: TextStyle(color: colorVerde, fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.center,
                            width: 70,
                            padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                              color: colorVerde,
                            ),
                            child: Text(
                              '10°',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      //RANKING GENERAL
                      Row(
                        children: [
                          Container(
                            width: 70,
                            child: Text(
                              'Ranking RM\nCompetitor',
                              style: TextStyle(color: colorVerde, fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.center,
                            width: 70,
                            padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                              color: colorVerde,
                            ),
                            child: Text(
                              '105°',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      //BOX AL QUE PERTENECE
                      Row(
                        children: [
                          Container(
                            width: 70,
                            child: Text(
                              'Gimnasio\nBox',
                              style: TextStyle(color: colorVerde, fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                buscarBox(context);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              alignment: Alignment.center,
                              width: 70,
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorVerde),
                              ),
                              child: FutureBuilder(
                                future: buscarFoto(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    return ClipRRect(
                                      child: Image.network(
                                        '${fotoLink}',
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  }
                                },
                              ), /*fotoLink == null ? Text('') : ClipRRect(
                                child: Image.network(
                                  'https://www.centrogaman.cl/wp-content/uploads/elementor/thumbs/logo-gaman-resp-pcl8qlcu4ofkt1n87wfwehuku77jm4qmudshtmevh6.png',
                                  fit: BoxFit.fill,
                                ),
                              ),*/
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //BOTONES DEL PERFIL
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //EDITAR PERFIL
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarPerfilPage(
                            usuario1: widget.usuario1FB,
                            listFotosPerfil: listFotosPerfilUpload,
                            listVideosPerfil: listVideosPerfilUpload,
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                    ),
                    child: Center(
                      child: Text(
                        'Editar Perfil',
                        style: TextStyle(color: colorVerde),
                      ),
                    ),
                  ),
                ),
                //CERRAR SESION
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VentanaInicial(
                            usuarioIngresado: false,
                            usuario1FB: UsuarioFB('1', '1', '1', '1', '1', '1','1', '1', '1', '1', '1', '1', '1', '1'),
                            listFotosPerfil: [Foto('1', '1')],
                            listVideosPerfil: [
                              Video('1', '1', '1', '1', '1', '1', '1')
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                    ),
                    child: Center(
                      child: Text(
                        'Cerrar Sesión',
                        style: TextStyle(color: colorVerde),
                      ),
                    ),
                  ),
                ),
                //AÑADIR FOTO
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pickImage(context);
                    });
                  },
                  child: Container(
                    //width: 160,
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: colorVerde,
                        size: 27,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //VIDEOS
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listVideosPerfilUpload.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    listVideosPerfilUpload[index].tipoVideo == '1'
                        ? Text('')
                        : Text(
                            '${listVideosPerfilUpload[index].tipoVideo}',
                            style: TextStyle(
                                fontSize: 12,
                                color: colorVerde,
                                fontWeight: FontWeight.bold),
                          ),
                    listVideosPerfilUpload[index].nombreVideo != '1'
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_controllerCJ != null) {
                                  _controllerCJ!.pause();
                                }
                                if (_controllerSN != null) {
                                  _controllerSN!.pause();
                                }
                                if (_controllerC != null) {
                                  _controllerC!.pause();
                                }
                                if (_controllerDL != null) {
                                  _controllerDL!.pause();
                                }
                                if (_controllerBS != null) {
                                  _controllerBS!.pause();
                                }
                                if (_controllerFS != null) {
                                  _controllerFS!.pause();
                                }

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PantallaVideoPage(
                                        videoPress:
                                            listVideosPerfilUpload[index],
                                      );
                                    });
                              });
                            },
                            child: Container(
                              height: 150,
                              width: 100,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: colorVerde),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: listVideosPerfilUpload[index]
                                            .tipoVideo ==
                                        'Clean & Jerk'
                                    ? AspectRatio(
                                        aspectRatio:
                                            _controllerCJ!.value.aspectRatio,
                                        child: VideoPlayer(_controllerCJ!),
                                      )
                                    : listVideosPerfilUpload[index].tipoVideo ==
                                            'Snatch'
                                        ? AspectRatio(
                                            aspectRatio: _controllerSN!
                                                .value.aspectRatio,
                                            child: VideoPlayer(_controllerSN!),
                                          )
                                        : listVideosPerfilUpload[index]
                                                    .tipoVideo ==
                                                'Clean'
                                            ? AspectRatio(
                                                aspectRatio: _controllerC!
                                                    .value.aspectRatio,
                                                child:
                                                    VideoPlayer(_controllerC!),
                                              )
                                            : listVideosPerfilUpload[index]
                                                        .tipoVideo ==
                                                    'Deadlift'
                                                ? AspectRatio(
                                                    aspectRatio: _controllerDL!
                                                        .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _controllerDL!),
                                                  )
                                                : listVideosPerfilUpload[index]
                                                            .tipoVideo ==
                                                        'BackSquat'
                                                    ? AspectRatio(
                                                        aspectRatio:
                                                            _controllerBS!.value
                                                                .aspectRatio,
                                                        child: VideoPlayer(
                                                            _controllerBS!),
                                                      )
                                                    : listVideosPerfilUpload[
                                                                    index]
                                                                .tipoVideo ==
                                                            'FrontSquat'
                                                        ? AspectRatio(
                                                            aspectRatio:
                                                                _controllerFS!
                                                                    .value
                                                                    .aspectRatio,
                                                            child: VideoPlayer(
                                                                _controllerFS!),
                                                          )
                                                        : Text(''),
                              ),
                            ),
                          )
                        //CUADRO CON EL ICONO DE FOTO SUBE TU RM
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                pickVideo(context);
                              });
                            },
                            child: Container(
                              height: 150,
                              width: 100,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: colorVerde),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_rounded,
                                    size: 40,
                                    color: colorVerde,
                                  ),
                                  Text(
                                    'Sube tú RM',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: colorVerde,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
          //PARRILLA DE FOTOS
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: listFotosPerfilUpload.length,
                padding: EdgeInsets.all(2.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: gridFotosFirebase(
                        '${listFotosPerfilUpload[index].urlImage}', context),
                    padding: EdgeInsets.all(0),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
