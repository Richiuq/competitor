import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/boxcomunidad_page.dart';
import 'package:competitor/ventanas/comunidad_page.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:competitor/widgets/cuadroBoxlista.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class ListaBoxComunidadPage extends StatefulWidget {
  const ListaBoxComunidadPage(
      {Key? key, required this.boxes, required this.usuario1})
      : super(key: key);

  final List<BoxGimnasioFB> boxes;
  final UsuarioFB usuario1;

  @override
  State<ListaBoxComunidadPage> createState() => _ListaBoxComunidadPageState();
}

class _ListaBoxComunidadPageState extends State<ListaBoxComunidadPage> {
  List<UsuarioFB> usuariosBox = [];
  List<Foto> listFotosBox = [];

  Future<void> buscarBox(BuildContext context, String nombreBox) async {
    await FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .doc(nombreBox)
        .get()
        .then((querySnapshot) {
      String fotoLink = querySnapshot.get('nombreFotoBox');
      String nombreBox = querySnapshot.get('nombreBox');
      String ubicacionBox = querySnapshot.get('ubicacionBox');

      FirebaseFirestore.instance
          .collection('BoxGimnasio')
          .doc(nombreBox)
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
          .doc(nombreBox)
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
            usuario1: widget.usuario1,
            box1: boxFB,
            usuariosBox: usuariosBox,
            listFotosBox: listFotosBox,
          ),
        ),
      );
    });
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComunidadPage(
                            usuario1: widget.usuario1, boxes: widget.boxes),
                      ),
                    );*/
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorVerde),
                  ),
                  child: GestureDetector(
                    child: Icon(
                      Icons.people_alt_rounded,
                      color: colorVerde,
                      size: 30,
                    ),
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
                      'Listado\nGimnasios/Box',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
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
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                width: double.infinity,
                child: Image.network(
                  'https://lh3.googleusercontent.com/p/AF1QipNmDCaaVTr8PTjuG0IZcU8my9NoIo4nGrU6sRz0=s1600-w400',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                margin: EdgeInsets.fromLTRB(0, 230, 0, 0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  color: colorVerde,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      margin: EdgeInsets.fromLTRB(3, 3, 3, 15),
                      padding: EdgeInsets.fromLTRB(7, 4, 5, 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colorVerde),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Valor Promedio',
                            style: TextStyle(color: colorVerde, fontSize: 14),
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 20,
                            color: colorVerde,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: widget.boxes.length,
                          itemBuilder: (context, index) {
                            //final item = widget.usuariosTotales[index];
                            return ListTile(
                              title: CuadroBox(
                                index: index,
                                box: widget.boxes[index],
                                onPress: () {
                                  setState(() {
                                    buscarBox(context, '${widget.boxes[index].nombreBox}');
                                  });
                                },
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
