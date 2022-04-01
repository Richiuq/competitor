import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/cargabarra_page.dart';
import 'package:competitor/ventanas/comunidad_page.dart';
import 'package:competitor/ventanas/ingresaperfil_page.dart';
import 'package:competitor/ventanas/marketplace_page.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:competitor/widgets/botonaceptar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'constantes.dart';

Future main() async {
  //EL FUTURE TAMBIEN ES POR FIREBASE
  WidgetsFlutterBinding.ensureInitialized(); //FIREBASE
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Competitor',
      home: VentanaInicial(
        usuarioIngresado: false,
        usuario1FB: UsuarioFB('1', '1', '1', '1', '1', '1', '1', '1', '1', '1',
            '1', '1', '1', '1'),
        listFotosPerfil: [Foto('1', '1')],
        listVideosPerfil: [Video('1', '1', '1', '1', '1', '1', '1')],
      ),
    );
  }
}

class VentanaInicial extends StatefulWidget {
  const VentanaInicial(
      {Key? key,
      required this.usuarioIngresado,
      required this.usuario1FB,
      required this.listFotosPerfil,
      required this.listVideosPerfil})
      : super(key: key);

  final bool usuarioIngresado;
  final UsuarioFB usuario1FB;
  final List<Foto> listFotosPerfil;
  final List<Video> listVideosPerfil;

  @override
  State<VentanaInicial> createState() => _VentanaInicialState();
}

class _VentanaInicialState extends State<VentanaInicial>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  List<BoxGimnasioFB> listBoxes = [];
  List<UsuarioFB> listUsuarios = [];
  List<PostFB> listaPostUsers = [];

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future buscarBoxesyFotos() async {
    listBoxes.clear();
    listUsuarios.clear();
    listaPostUsers.clear();

    await FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .snapshots()
        .listen((event) {
      listBoxes = event.docs
          .map(
            (e) => BoxGimnasioFB(
              e['nombreBox'],
              e['nombreFotoBox'],
              e['ubicacionBox'],
            ),
          )
          .toList();
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
              UsuarioFB userEleg = UsuarioFB(
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
              listUsuarios.add(userEleg);
              FirebaseFirestore.instance
                  .collection('BoxGimnasio')
                  .doc(result2.get('boxPerfil'))
                  .collection('Usuarios')
                  .doc(result2.get('correoPerfil'))
                  .collection('Foto')
                  .get()
                  .then((querySnapshot3) {
                querySnapshot3.docs.forEach((result3) {
                  PostFB postFotos = PostFB(
                    result2.get('nombrePerfil'),
                    result2.get('nombreFotoPerfil'),
                    result2.get('correoPerfil'),
                    result3.get('nombreFoto'),
                    result3.get('urlImage'),
                    '0',
                    '0',
                    '0',
                    '0',
                    '0',
                    '0',
                    '0',
                    result3.get('nombreFoto'),
                  );
                  if (postFotos.nombreFoto != '1') {
                    listaPostUsers.add(postFotos);
                  }
                });
              });
              FirebaseFirestore.instance
                  .collection('BoxGimnasio')
                  .doc(result2.get('boxPerfil'))
                  .collection('Usuarios')
                  .doc(result2.get('correoPerfil'))
                  .collection('Video')
                  .get()
                  .then((querySnapshot4) {
                querySnapshot4.docs.forEach((result4) {
                  PostFB postVideos = PostFB(
                    result2.get('nombrePerfil'),
                    result2.get('nombreFotoPerfil'),
                    result2.get('correoPerfil'),
                    '0',
                    '0',
                    result4.get('cantNoRep'),
                    result4.get('cantRep'),
                    result4.get('lbkgVideo'),
                    result4.get('pesoVideo'),
                    result4.get('tipoVideo'),
                    result4.get('nombreVideo'),
                    result4.get('linkVideo'),
                    result4.get('nombreVideo'),
                  );
                  if (postVideos.nombreVideo != '1') {
                    listaPostUsers.add(postVideos);
                  }
                });
              });
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComunidadPage(
                      usuario1: widget.usuario1FB,
                      boxes: listBoxes,
                      usuariosBox: listUsuarios,
                      listaPostUsers: listaPostUsers,
                    ),
                  ),
                );
              });
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorVerde,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 150,
            ),
            //LOGO
            Container(
              height: 300,
              child: Image.asset(
                'images/logo_rm.png',
                fit: BoxFit.contain,
              ),
            ),
            //BOTONES CARGA BARRA Y COMUNIDAD
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //BOTON CARGA BARRA
                  GestureDetector(
                    onTapDown: _tapDown,
                    onTapUp: _tapUp,
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CargaBarraPage(
                              usuario1: widget.usuario1FB,
                              listFotosPerfil: widget.listFotosPerfil,
                              listVideosPerfil: widget.listVideosPerfil,
                            ),
                          ),
                        );
                      });
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorVerde),
                                boxShadow: [shadowBoxesInicio],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'images/cargabarraInicio.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Carga tú barra',
                                style: inicialStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //BOTON COMUNIDAD
                  GestureDetector(
                    onTapDown: _tapDown,
                    onTapUp: _tapUp,
                    onTap: () {
                      setState(() {
                        widget.usuarioIngresado
                            ? buscarBoxesyFotos()
                            : showDialog(
                                context: context,
                                builder: (context) {
                                  return BotonAceptar();
                                });
                      });
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorVerde),
                                boxShadow: [shadowBoxesInicio],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'images/marketplaceInicio.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Comunidad',
                                style: inicialStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            widget.usuarioIngresado
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerfilUsuarioPage(
                              usuario1FB: widget.usuario1FB,
                              listFotosPerfil: widget.listFotosPerfil,
                              listVideosPerfil: widget.listVideosPerfil,
                            ),
                          ),
                        );
                      });
                    },
                    onTapDown: _tapDown,
                    onTapUp: _tapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                          color: colorVerdeOsc,
                        ),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hola ${(widget.usuario1FB.nombrePerfil)}!',
                              style: iniciasesionlStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return IngresaPerfilPage();
                            });
                      });
                    },
                    onTapDown: _tapDown,
                    onTapUp: _tapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                          color: colorVerdeOsc,
                        ),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Ingresa',
                              style: iniciasesionlStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
