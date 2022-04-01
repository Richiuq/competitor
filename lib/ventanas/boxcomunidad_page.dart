import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/comunidad_page.dart';
import 'package:competitor/ventanas/listaboxcomunidad_page.dart';
import 'package:competitor/widgets/botonvideoaceptar.dart';
import 'package:competitor/widgets/fotodialog.dart';
import 'package:flutter/material.dart';

class BoxComunidadPage extends StatefulWidget {
  const BoxComunidadPage({
    Key? key,
    required this.usuario1,
    required this.box1,
    required this.usuariosBox,
    required this.listFotosBox,
  }) : super(key: key);

  final UsuarioFB usuario1;
  final BoxGimnasioFB box1;
  final List<UsuarioFB> usuariosBox;
  final List<Foto> listFotosBox;

/*  final BoxGimnasioFB boxPresionado;
  final List<BoxGimnasio> boxes;*/

  @override
  State<BoxComunidadPage> createState() => _BoxComunidadPageState();
}

class _BoxComunidadPageState extends State<BoxComunidadPage> {
  @override
  void initState() {
    super.initState();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                            builder: (context) =>
                                ComunidadPage(
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
                        )
                        ,
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
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //FOTO/SEG
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    width: 160,
                    child: Stack(
                      children: [
                        //SEGUIDORES
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '10.3k',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Seg.',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '4.5k',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Sig.',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //FOTO PERFIL
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 10, 0, 10),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: colorVerde),
                            boxShadow: [shadowBoxesInicio],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                              (widget.box1.nombreFotoBox).toString(),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //NOMBRE
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      '${widget.box1.nombreBox}',
                      style: TextStyle(
                          fontSize: 20,
                          color: colorVerde,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      'Aquí hablo sobre mí, como en\n'
                      'instragram o incluso puedo\n'
                      'poner emoticones, otras redes\n'
                      'sociales, etc...más.',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            'Miembros / RM Competitor',
                            style: TextStyle(color: colorVerde, fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          alignment: Alignment.center,
                          width: 140,
                          padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                            color: colorVerde,
                          ),
                          child: Text(
                            '250/${widget.usuariosBox.length}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            'Ubicación',
                            style: TextStyle(color: colorVerde, fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          alignment: Alignment.center,
                          width: 140,
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                            color: colorVerde,
                          ),
                          child: Text(
                            '${widget.box1.ubicacionBox}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            'Web o Instagram',
                            style: TextStyle(color: colorVerde, fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          alignment: Alignment.center,
                          width: 140,
                          padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                            color: colorVerde,
                          ),
                          child: Text(
                            '${widget.box1.nombreBox}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
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
        //BOTONES
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  width: 160,
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorVerde),
                  ),
                  child: Center(
                    child: Text(
                      'Seguir',
                      style: TextStyle(color: colorVerde),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  width: 160,
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorVerde),
                  ),
                  child: Center(
                    child: Text(
                      'Mensaje',
                      style: TextStyle(color: colorVerde),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //PARRILLA DE FOTOS
        Expanded(
          child: Container(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: widget.listFotosBox.length,
              padding: EdgeInsets.all(2.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.transparent,
                  child: gridFotosFirebase(
                      '${widget.listFotosBox[index].urlImage}', context),
                  padding: EdgeInsets.all(0),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
