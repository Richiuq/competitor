import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/listaboxcomunidad_page.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:competitor/ventanas/post_pages.dart';
import 'package:competitor/ventanas/ranking_page.dart';
import 'package:competitor/widgets/cuadroInicio.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ComunidadPage extends StatefulWidget {
  const ComunidadPage(
      {Key? key,
      required this.usuario1,
      required this.boxes,
      required this.usuariosBox,
      required this.listaPostUsers})
      : super(key: key);

  final UsuarioFB usuario1;
  final List<BoxGimnasioFB> boxes;
  final List<UsuarioFB> usuariosBox;
  final List<PostFB> listaPostUsers;

  @override
  _ComunidadPageState createState() => _ComunidadPageState();
}

class _ComunidadPageState extends State<ComunidadPage> {
  bool muroRanking = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          builder: (context) => PerfilUsuarioPage(
                            usuario1: widget.usuario1,
                            boxes: widget.boxes,
                          ),
                        ),
                      );*/
                    });
                  },
                  child: Icon(
                    Icons.person,
                    color: colorVerde,
                    size: 30,
                  ),
                ),
              ),
              Container(
                  width: 200,
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorVerde),
                    boxShadow: [shadowBoxesInicio],
                    color: colorVerde,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comunidad\nCarga la barra',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      Icon(
                        Icons.people_alt_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListaBoxComunidadPage(
                            boxes: widget.boxes,
                            usuario1: widget.usuario1,
                          ),
                        ),
                      );
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
          //SEGUNDO MENU SUPERIOR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    muroRanking = true;
                  });
                },
                child: Container(
                  width: 100,
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                  alignment: Alignment.center,
                  decoration: muroRanking
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorVerde),
                          boxShadow: [shadowBoxesInicio],
                          color: colorVerde,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorVerde),
                          color: Colors.white,
                        ),
                  child: Text(
                    'Muro',
                    style: muroRanking
                        ? TextStyle(fontSize: 15.0, color: Colors.white)
                        : TextStyle(fontSize: 15.0, color: colorVerde),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    muroRanking = false;
                  });
                },
                child: Container(
                  width: 100,
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                  alignment: Alignment.center,
                  decoration: muroRanking
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorVerde),
                          color: Colors.white,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorVerde),
                          boxShadow: [shadowBoxesInicio],
                          color: colorVerde,
                        ),
                  child: Text(
                    'Ranking',
                    style: muroRanking
                        ? TextStyle(fontSize: 15.0, color: colorVerde)
                        : TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      print('+');
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: colorVerde,
                    size: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      print('like');
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: colorVerde,
                    size: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      print('chat');
                    });
                  },
                  child: Icon(
                    Icons.chat,
                    color: colorVerde,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          muroRanking
              ? PostPage(
                  listaPostUsers: widget.listaPostUsers,
                )
              : RankingPage(
                  usuariosTotales: widget.usuariosBox,
                  usuario1: widget.usuario1),
        ],
      ),
    );
  }
}
