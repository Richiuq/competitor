import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/boxcomunidad_page.dart';
import 'package:competitor/ventanas/comunidad_page.dart';
import 'package:competitor/ventanas/listaboxcomunidad_page.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:competitor/ventanas/validacionmov_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PerfilComunidadPage extends StatefulWidget {
  const PerfilComunidadPage({
    Key? key,
    required this.usuario1,
    required this.usuarioTotal,
    required this.listFotosPerfil,
    required this.listVideosPerfil,
  }) : super(key: key);

  final UsuarioFB usuario1;
  final UsuarioFB usuarioTotal;
  final List<Foto> listFotosPerfil;
  final List<Video> listVideosPerfil;

  @override
  State<PerfilComunidadPage> createState() => _PerfilComunidadPageState();
}

class _PerfilComunidadPageState extends State<PerfilComunidadPage> {
  bool botonSegMen = true;
  VideoPlayerController? _controllerCJ;

  @override
  void initState() {
    _controllerCJ = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/rmcompetitor-3e289.appspot.com/o/richiuq@gmail.com%2Ftrim.C474C71E-7E39-402D-8CB0-86D184F4D125.MOV?alt=media&token=d73085f8-9159-4f54-a8b6-04aafcbb7993',
    );
    _controllerCJ!.initialize();
    _controllerCJ!.setLooping(false);
    _controllerCJ!.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCJ!.dispose();
    super.dispose();
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
                width: 190,
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorVerde),
                  boxShadow: [shadowBoxesInicio],
                  color: colorVerde,
                ),
                child: Text(
                  '${widget.usuario1.nombrePerfil}',
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
                            boxes: widget.boxes, usuarioIngresado: true,
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
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                  (widget.usuarioTotal.nombreFotoPerfil)
                                      .toString(),
                                  fit: BoxFit.cover,
                                )),
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
                                  '10.3k',
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
                                  '4.5k',
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
                        '${widget.usuarioTotal.nombrePerfil}',
                        style: TextStyle(
                            fontSize: 20,
                            color: colorVerde,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        '${widget.usuarioTotal.presentPerfil}',
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
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  height: 210,
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+RM  kg',
                        style: TextStyle(
                            color: colorVerde,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
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
                                /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BoxComunidadPage(
                                      usuario1: widget.usuario1,
                                      boxPresionado: boxPresionado,
                                      boxes: widget.boxes,
                                    ),
                                  ),
                                );*/
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
                              child: ClipRRect(
                                child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/rmcompetitor-3e289.appspot.com/o/richiuq@gmail.com%2Fimage_picker_1BF0A97C-D3A6-4ED8-878C-3595843ED285-82808-00000AED302AE2FA.jpg?alt=media&token=09120c21-bb12-4112-b704-22b091c32b32',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
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
            margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (botonSegMen != true) {
                        botonSegMen = true;
                      } else {
                        botonSegMen = false;
                      }
                    });
                  },
                  child: Container(
                    width: 160,
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(5),
                    decoration: botonSegMen
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorVerde),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                            color: colorVerde,
                          ),
                    child: Center(
                      child: Text(
                        'Seguir',
                        style: botonSegMen
                            ? TextStyle(color: colorVerde)
                            : TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (botonSegMen != true) {
                        botonSegMen = true;
                      } else {
                        botonSegMen = false;
                      }
                    });
                  },
                  child: Container(
                    width: 160,
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(5),
                    decoration: botonSegMen
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                            color: colorVerde,
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorVerde),
                          ),
                    child: Center(
                      child: Text(
                        'Mensaje',
                        style: botonSegMen
                            ? TextStyle(color: Colors.white)
                            : TextStyle(color: colorVerde),
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
                itemCount: widget.listVideosPerfil.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(
                        '${widget.listVideosPerfil[index].tipoVideo}',
                        style: TextStyle(
                            fontSize: 12,
                            color: colorVerde,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 150,
                        width: 100,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: colorVerde),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: AspectRatio(
                            aspectRatio: _controllerCJ!.value.aspectRatio,
                            child: VideoPlayer(_controllerCJ!),
                          ),
                        ),
                      ),
                    ],
                  );

                  /*Column(
                    children: [
                      widget.listVideosPerfil[index].tipoVideo == '1'
                          ? Text('')
                          : Text(
                              '${widget.listVideosPerfil[index].tipoVideo}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: colorVerde,
                                  fontWeight: FontWeight.bold),
                            ),
                      widget.listVideosPerfil[index].nombreVideo != '1'
                          ? Container(
                              height: 150,
                              width: 100,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: colorVerde),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: widget.listVideosPerfil[index]
                                            .tipoVideo ==
                                        'Clean & Jerk'
                                    ? AspectRatio(
                                        aspectRatio:
                                            _controllerCJ!.value.aspectRatio,
                                        child: VideoPlayer(_controllerCJ!),
                                      )
                                    : widget.listVideosPerfil[index]
                                                .tipoVideo ==
                                            'Snatch'
                                        ? AspectRatio(
                                            aspectRatio: _controllerSN!
                                                .value.aspectRatio,
                                            child: VideoPlayer(_controllerSN!),
                                          )
                                        : widget.listVideosPerfil[index]
                                                    .tipoVideo ==
                                                'Clean'
                                            ? AspectRatio(
                                                aspectRatio: _controllerC!
                                                    .value.aspectRatio,
                                                child:
                                                    VideoPlayer(_controllerC!),
                                              )
                                            : widget.listVideosPerfil[index]
                                                        .tipoVideo ==
                                                    'Deadlift'
                                                ? AspectRatio(
                                                    aspectRatio: _controllerDL!
                                                        .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _controllerDL!),
                                                  )
                                                : widget.listVideosPerfil[index]
                                                            .tipoVideo ==
                                                        'BackSquat'
                                                    ? AspectRatio(
                                                        aspectRatio:
                                                            _controllerBS!.value
                                                                .aspectRatio,
                                                        child: VideoPlayer(
                                                            _controllerBS!),
                                                      )
                                                    : widget
                                                                .listVideosPerfil[
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
                            )
                          : Text(''),
                    ],
                  );*/
                }),
          ),
          //FOTOS PERFIL
        ],
      ),
    );
  }
/*
  BoxGimnasio? buscarBox(String? chosenValueBox, List<BoxGimnasio> boxUsuario) {
    BoxGimnasio? boxUsuarioEleg;
    for (var i = 0; i < boxUsuario.length; i++) {
      if (chosenValueBox == boxUsuario[i].nombreBox) {
        boxUsuarioEleg = boxUsuario[i];
      }
    }
    return boxUsuarioEleg;
  }*/
}
