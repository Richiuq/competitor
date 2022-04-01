import 'package:competitor/constantes.dart';
import 'package:competitor/main.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/boxcomunidad_page.dart';
import 'package:competitor/ventanas/comunidad_page.dart';
import 'package:competitor/ventanas/elegirporcentaje_page.dart';
import 'package:competitor/ventanas/ingresaperfil_page.dart';
import 'package:competitor/ventanas/listaboxcomunidad_page.dart';
import 'package:competitor/ventanas/perfilusuario_page.dart';
import 'package:competitor/widgets/barracargada.dart';
import 'package:competitor/widgets/botonporcentaje.dart';
import 'package:competitor/widgets/cuadrormguardados.dart';
import 'package:competitor/widgets/discoscargados.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CargaBarraPage extends StatefulWidget {
  const CargaBarraPage(
      {Key? key,
      required this.usuario1,
      required this.listFotosPerfil,
      required this.listVideosPerfil})
      : super(key: key);

  final UsuarioFB usuario1;
  final List<Foto> listFotosPerfil;
  final List<Video> listVideosPerfil;

  @override
  _CargaBarraPageState createState() => _CargaBarraPageState();
}

class _CargaBarraPageState extends State<CargaBarraPage>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  TextEditingController controlPorcEleg = TextEditingController();

  //OPCIONES DEFAULT MODIFICABLES SI HAY USUARIO
  int k100lbs = 225;
  int kilosBarra = 190;
  String tipoDiscos = 'Kilos (kg)';
  String tipoBarra = '35 lb';
  int autBarraOlimpicalbs = 35; //VER SI SACAR PK NO HACE NADA

  //RESTO VARIABLES
  String porcElegido = '';
  String pesoPresionado = 'Clean';
  int botonPress = 100;
  double posicionBarra = -380;
  int autFrac05kg = 0;
  int autFrac1kg = 0;
  int autFrac15kg = 0;
  int autFrac2kg = 0;
  int autFrac25kg = 0;
  int autFrac5kg = 0;
  int autBumper10lbs = 0;
  int autBumper15lbs = 0;
  int autBumper25lbs = 0;
  int autBumper35lbs = 0;
  int autBumper45lbs = 0;
  int autBumper10kg = 0;
  int autBumper15kg = 0;
  int autBumper20kg = 0;
  int autBumper25kg = 0;
  int resultado = 0;
  int autContadorDiscos = 0;
  int autVariable10lb = 0;
  int autVariable15lb = 0;
  int autVariable25lb = 0;
  int autVariable35lb = 0;
  int autVariable45lb = 0;
  int autVariable10kg = 0;
  int autVariable15kg = 0;
  int autVariable20kg = 0;
  int autVariable25kg = 0;
  int autVarfracc05kg = 0;
  int autVarfracc1kg = 0;
  int autVarfracc15kg = 0;
  int autVarfracc2kg = 0;
  int autVarfracc25kg = 0;
  int autVarfracc5kg = 0;

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
    if (widget.usuario1.nombrePerfil != '1') {
      //USUARIO MAXIMOS INICIALES
      var pesoClean = widget.usuario1.pesoClean;
      k100lbs = int.parse(pesoClean!);
      //USUARIO TIPO BARRA
      if (widget.usuario1.chosenValueTB != '35 lb') {
        tipoBarra = '45 lb';
      }
      //USUARIO TIPO DISCOS
      if (widget.usuario1.chosenValueTD != 'Kilos (kg)') {
        tipoDiscos = 'Libras (lb)';
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
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
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorVerde),
                      boxShadow: [shadowBoxesInicio],
                      color: colorVerde,
                    ),
                    child: GestureDetector(
                      onTapDown: _tapDown,
                      onTapUp: _tapUp,
                      onTap: () {
                        setState(() {
                          if (widget.usuario1.correoPerfil == '1') {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return IngresaPerfilPage();
                                });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PerfilUsuarioPage(
                                  usuario1FB: widget.usuario1,
                                  listFotosPerfil: widget.listFotosPerfil,
                                  listVideosPerfil: widget.listVideosPerfil,
                                ),
                              ),
                            );
                          }
                        });
                      },
                      child: widget.usuario1.correoPerfil == '1'
                          ? Transform.scale(
                              scale: _scale,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  'RM Competitor',
                                  style: titulormcompStyle2,
                                ),
                              ),
                            )
                          : Transform.scale(
                              scale: _scale,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  '${widget.usuario1.nombrePerfil}',
                                  style: titulormcompStyle2,
                                ),
                              ),
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
                      onTapDown: _tapDown,
                      onTapUp: _tapUp,
                      onTap: () {
                        setState(() {
                          /*widget.usuario1.nombrePerfil != '1'
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComunidadPage(
                                      usuario1: widget.usuario1,
                                      boxes: widget.boxes,
                                    ),
                                  ),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return IngresaPerfilPage();
                                  });*/
                        });
                      },
                      child: Transform.scale(
                        scale: _scale,
                        child: Icon(
                          Icons.people_alt_rounded,
                          color: colorVerde,
                          size: 30,
                        ),
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
                      onTapDown: _tapDown,
                      onTapUp: _tapUp,
                      onTap: () {
                        setState(() {
                          /*widget.usuario1.nombrePerfil != '1'
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListaBoxComunidadPage(
                                      usuario1: widget.usuario1,
                                      boxes: widget.boxes,
                                    ),
                                  ),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return IngresaPerfilPage();
                                  });*/
                        });
                      },
                      child: Transform.scale(
                        scale: _scale,
                        child: Icon(
                          Icons.shopping_cart,
                          color: colorVerde,
                          size: 30,
                        ),
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
                      onTapDown: _tapDown,
                      onTapUp: _tapUp,
                      onTap: () {
                        setState(() {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VentanaInicial(
                                usuario1: widget.usuario1,
                                boxes: widget.boxes,
                                usuarioIngresado:
                                    widget.usuario1.nombrePost != '1'
                                        ? true
                                        : false,
                              ),
                            ),
                          );*/
                        });
                      },
                      child: Transform.scale(
                        scale: _scale,
                        child: Icon(
                          Icons.view_headline,
                          color: colorVerde,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //PESOS PARA CARGAR Y RUEDA
              Container(
                margin: EdgeInsets.fromLTRB(10, 30, 2, 10),
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //FOTOS Y PESOS GUARDADOS
                    widget.usuario1.correoPerfil == '1'
                        ? Text('')
                        : Row(
                            children: [
                              //TEXTO RM
                              const Text(
                                'RM',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: colorVerde,
                                    fontWeight: FontWeight.bold),
                              ),
                              CuadroRMGuardados(
                                scale: _scale,
                                tapDown: _tapDown,
                                tapUp: _tapUp,
                                onTap: () {
                                  setState(() {
                                    posicionBarra = -380;
                                    pesoPresionado = 'Clean';
                                    reinicioPesos();
                                    k100lbs =
                                        int.parse(widget.usuario1.pesoClean!);
                                    botonPress = 100;
                                  });
                                },
                                pesoPresionado: pesoPresionado,
                                tipoPeso: 'Clean',
                                pesoPerfil:
                                    int.parse(widget.usuario1.pesoClean!),
                                fotoMov:
                                    'https://www.crossfitinvictus.com/wp-content/uploads/2020/01/Front_Squats-1-1024x621.jpg',
                              ),
                              CuadroRMGuardados(
                                scale: _scale,
                                tapDown: _tapDown,
                                tapUp: _tapUp,
                                onTap: () {
                                  setState(() {
                                    posicionBarra = -380;
                                    pesoPresionado = 'Clean &\nJerk';
                                    reinicioPesos();
                                    k100lbs = int.parse(
                                        widget.usuario1.pesoCleanJerk!);
                                    botonPress = 100;
                                  });
                                },
                                pesoPresionado: pesoPresionado,
                                tipoPeso: 'Clean &\nJerk',
                                pesoPerfil:
                                    int.parse(widget.usuario1.pesoCleanJerk!),
                                fotoMov:
                                    'https://www.zonawod.com/wp-content/uploads/clean-and-jerk-crossfit-rich-froning.jpeg',
                              ),
                              CuadroRMGuardados(
                                scale: _scale,
                                tapDown: _tapDown,
                                tapUp: _tapUp,
                                onTap: () {
                                  setState(() {
                                    posicionBarra = -380;
                                    pesoPresionado = 'Snatch';
                                    reinicioPesos();
                                    k100lbs =
                                        int.parse(widget.usuario1.pesoSnatch!);
                                    botonPress = 100;
                                  });
                                },
                                pesoPresionado: pesoPresionado,
                                tipoPeso: 'Snatch',
                                pesoPerfil:
                                    int.parse(widget.usuario1.pesoSnatch!),
                                fotoMov:
                                    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F35%2F2020%2F04%2F09%2Fhow-to-do-snatch-crossfit.jpg',
                              ),
                              CuadroRMGuardados(
                                scale: _scale,
                                tapDown: _tapDown,
                                tapUp: _tapUp,
                                onTap: () {
                                  setState(() {
                                    posicionBarra = -380;
                                    pesoPresionado = 'Deadlift';
                                    reinicioPesos();
                                    k100lbs = int.parse(
                                        widget.usuario1.pesoDeadlift!);
                                    botonPress = 100;
                                  });
                                },
                                pesoPresionado: pesoPresionado,
                                tipoPeso: 'Deadlift',
                                pesoPerfil:
                                    int.parse(widget.usuario1.pesoDeadlift!),
                                fotoMov:
                                    'https://i0.wp.com/boxjunkies.com/wp-content/uploads/2017/03/Deadlift-crossfit.jpg?w=460&ssl=1',
                              ),
                              CuadroRMGuardados(
                                scale: _scale,
                                tapDown: _tapDown,
                                tapUp: _tapUp,
                                onTap: () {
                                  setState(() {
                                    posicionBarra = -380;
                                    pesoPresionado = 'Back\nsquat';
                                    reinicioPesos();
                                    k100lbs = int.parse(
                                        widget.usuario1.pesoBackSquat!);
                                    botonPress = 100;
                                  });
                                },
                                pesoPresionado: pesoPresionado,
                                tipoPeso: 'Back\nsquat',
                                pesoPerfil:
                                    int.parse(widget.usuario1.pesoBackSquat!),
                                fotoMov:
                                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/female-athlete-exercising-with-barbell-in-gym-royalty-free-image-1569411677.jpg?resize=980:*',
                              ),
                              CuadroRMGuardados(
                                tapDown: _tapDown,
                                tapUp: _tapUp,
                                onTap: () {
                                  setState(() {
                                    posicionBarra = -380;
                                    pesoPresionado = 'Front\nsquat';
                                    reinicioPesos();
                                    k100lbs = int.parse(
                                        widget.usuario1.pesoFrontSquat!);
                                    botonPress = 100;
                                  });
                                },
                                pesoPresionado: pesoPresionado,
                                tipoPeso: 'Front\nsquat',
                                pesoPerfil:
                                    int.parse(widget.usuario1.pesoFrontSquat!),
                                fotoMov:
                                    'https://images.squarespace-cdn.com/content/v1/5160bb45e4b0e13a258812c8/1448323881710-WBF105CRJ4F3DFBL8ERF/image-asset.jpeg?format=750w',
                                scale: _scale,
                              ),
                            ],
                          ),
                    //NUMPICKER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.usuario1.correoPerfil == '1'
                            ? //TEXTO RM
                            const Text(
                                'RM',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: colorVerde,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(''),
                        //NUMPICKER
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          padding: EdgeInsets.all(5),
                          width: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: colorVerde),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${(k100lbs * transfKlLb).toInt()} kg',
                                style: pesoElegidoStyle,
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 80,
                                width: 2,
                                color: colorVerde,
                              ),
                              NumberPicker(
                                selectedTextStyle: pesoElegidolbStyle,
                                textStyle: pesoElegidolbchicoStyle,
                                value: k100lbs,
                                minValue: 35,
                                maxValue: 500,
                                step: 1,
                                haptics: true,
                                onChanged: (value) {
                                  setState(() {
                                    k100lbs = value;
                                    k100lbs = (k100lbs) * 1;
                                    posicionBarra = -380;
                                    reinicioPesos();
                                  });
                                },
                              ),
                              Text(
                                'lb',
                                style: textolibrasStyle,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //ELEGIR TIPO DISCO O TIPO DE BARRA
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'Discos',
                            style: titulormcompStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 140,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: colorVerde),
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTapDown: _tapDown,
                            onTapUp: _tapUp,
                            onTap: () {
                              setState(() {
                                if (tipoDiscos == 'Kilos (kg)') {
                                  tipoDiscos = 'Libras (lb)';
                                } else {
                                  tipoDiscos = 'Kilos (kg)';
                                }
                              });
                            },
                            child: Transform.scale(
                              scale: _scale,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: tipoDiscos == 'Kilos (kg)'
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border:
                                                Border.all(color: colorVerde),
                                            color: colorVerde,
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                    child: Text(
                                      'KG',
                                      style: TextStyle(
                                          color: tipoDiscos == 'Kilos (kg)'
                                              ? Colors.white
                                              : colorVerde,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: tipoDiscos == 'Kilos (kg)'
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border:
                                                Border.all(color: Colors.white),
                                            color: Colors.white,
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border:
                                                Border.all(color: colorVerde),
                                            color: colorVerde,
                                          ),
                                    child: Text(
                                      'LB',
                                      style: TextStyle(
                                          color: tipoDiscos == 'Kilos (kg)'
                                              ? colorVerde
                                              : Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'Barra',
                            style: titulormcompStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 140,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: colorVerde),
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTapDown: _tapDown,
                            onTapUp: _tapUp,
                            onTap: () {
                              setState(() {
                                if (tipoBarra == '35 lb') {
                                  tipoBarra = '45 lb';
                                } else {
                                  tipoBarra = '35 lb';
                                }
                              });
                            },
                            child: Transform.scale(
                              scale: _scale,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: tipoBarra == '35 lb'
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border:
                                                Border.all(color: colorVerde),
                                            color: colorVerde,
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                    child: Text(
                                      '35lb',
                                      style: TextStyle(
                                          color: tipoBarra == '35 lb'
                                              ? Colors.white
                                              : colorVerde,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: tipoBarra == '45 lb'
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border:
                                                Border.all(color: colorVerde),
                                            color: colorVerde,
                                          )
                                        : BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                    child: Text(
                                      '45lb',
                                      style: TextStyle(
                                          color: tipoBarra == '35 lb'
                                              ? colorVerde
                                              : Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //CUADRO DE PORCENTAJES
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 100;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 1,
                          porcentajeelegido: 100,
                          botonPress: botonPress,
                        ),
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 95;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 0.95,
                          porcentajeelegido: 95,
                          botonPress: botonPress,
                        ),
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 90;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 0.90,
                          porcentajeelegido: 90,
                          botonPress: botonPress,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 85;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 0.85,
                          porcentajeelegido: 85,
                          botonPress: botonPress,
                        ),
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 80;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 0.80,
                          porcentajeelegido: 80,
                          botonPress: botonPress,
                        ),
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 75;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 0.75,
                          porcentajeelegido: 75,
                          botonPress: botonPress,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 70;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 0.70,
                          porcentajeelegido: 70,
                          botonPress: botonPress,
                        ),
                        BotonPorcentaje(
                          scale: _scale,
                          tapDown: _tapDown,
                          tapUp: _tapUp,
                          k100lbs: k100lbs,
                          onTap: () {
                            setState(() {
                              botonPress = 65;
                              porcElegido = '';
                            });
                          },
                          porcentaje: 0.65,
                          porcentajeelegido: 65,
                          botonPress: botonPress,
                        ),
                        //PORCENTAJE SETIADO
                        GestureDetector(
                          onTapDown: _tapDown,
                          onTapUp: _tapUp,
                          onTap: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ElegirPorcentaje(
                                      onPress: () {
                                        setState(() {
                                          porcElegido = controlPorcEleg.text;
                                          botonPress = int.parse(porcElegido);
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      controPorcEleg: controlPorcEleg,
                                    );
                                  });
                            });
                          },
                          child: Transform.scale(
                            scale: _scale,
                            child: Container(
                              width: 110,
                              height: 80,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color: porcElegido != ''
                                    ? colorVerde
                                    : Colors.white,
                                boxShadow: porcElegido != ''
                                    ? [shadowBoxesInicio]
                                    : [],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    porcElegido == ''
                                        ? 'OTRO %'
                                        : '$porcElegido %',
                                    style: porcElegido != ''
                                        ? porcentajePressStyle
                                        : porcentajeNoPressStyle,
                                  ),
                                  porcElegido != ''
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${(k100lbs * transfKlLb * (int.parse(porcElegido) / 100)).toInt().toString()}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'kg',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              ' | ',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '${(k100lbs * (int.parse(porcElegido) / 100)).toInt().toString()}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'lb',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      : Text(''),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          //MENU DE BARRA CARGADA
          AnimatedPositioned(
            bottom: posicionBarra,
            right: 0,
            left: 0,
            duration: Duration(milliseconds: 600),
            child: Container(
              height: 480,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: colorVerde,
              ),
              child: Column(
                children: [
                  //TEXTO CARGA TU BARRA Y ESCONDE PANEL
                  GestureDetector(
                    onTapDown: _tapDown,
                    onTapUp: _tapUp,
                    onTap: () {
                      //CUANDO APRIETE CARGAR SUBE UNA PESTAÑA BLANCA CON BORDES REDONDOS Y MUESTRA LA BARRA CON EL PESO CARGADO Y LOS DISCOS
                      setState(() {
                        if (tipoBarra == '35 lb') {
                          if (tipoDiscos == 'Libras (lb)') {
                            autBarraOlimpicalbs = 35;
                          } else {
                            autBarraOlimpicalbs = 15;
                          }
                        } else {
                          if (tipoDiscos == 'Libras (lb)') {
                            autBarraOlimpicalbs = 45;
                          } else {
                            autBarraOlimpicalbs = 20;
                          }
                        }
                        if (posicionBarra == -380) {
                          posicionBarra = 0;
                          if (tipoDiscos == 'Kilos (kg)') {
                            kilosBarra =
                                (k100lbs * transfKlLb * (botonPress / 100))
                                        .toInt() -
                                    autBarraOlimpicalbs;
                            colocarDiscos(kilosBarra, tipoDiscos);
                          } else {
                            kilosBarra =
                                (k100lbs * (botonPress / 100)).toInt() -
                                    autBarraOlimpicalbs;
                            colocarDiscos(kilosBarra, tipoDiscos);
                          }
                        } else {
                          reinicioPesos();
                          posicionBarra = -380;
                        }
                      });
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                        child: Text(
                          'CARGA TU BARRA!',
                          style: botonCargarStyle,
                        ),
                      ),
                    ),
                  ),
                  //DISCOS DE LA BARRA
                  DiscosCargados(
                    autFrac05kg: autFrac05kg,
                    autFrac1kg: autFrac1kg,
                    autFrac15kg: autFrac15kg,
                    autFrac2kg: autFrac2kg,
                    autFrac25kg: autFrac25kg,
                    autFrac5kg: autFrac5kg,
                    autBumper10lbs: autBumper10lbs,
                    autBumper15lbs: autBumper15lbs,
                    autBumper25lbs: autBumper25lbs,
                    autBumper35lbs: autBumper35lbs,
                    autBumper45lbs: autBumper45lbs,
                    autBumper10kg: autBumper10kg,
                    autBumper15kg: autBumper15kg,
                    autBumper20kg: autBumper20kg,
                    autBumper25kg: autBumper25kg,
                  ),
                  //CUADRO CON LA BARRA
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      BarraCargada(
                        botonPress: botonPress,
                        k100lbs: k100lbs,
                        //FALTA EL AMBOS****
                        barra: tipoBarra,
                        autFrac05kg: autFrac05kg,
                        autFrac1kg: autFrac1kg,
                        autFrac15kg: autFrac15kg,
                        autFrac2kg: autFrac2kg,
                        autFrac25kg: autFrac25kg,
                        autFrac5kg: autFrac5kg,
                        autBumper10lbs: autBumper10lbs,
                        autBumper15lbs: autBumper15lbs,
                        autBumper25lbs: autBumper25lbs,
                        autBumper35lbs: autBumper35lbs,
                        autBumper45lbs: autBumper45lbs,
                        autBumper10kg: autBumper10kg,
                        autBumper15kg: autBumper15kg,
                        autBumper20kg: autBumper20kg,
                        autBumper25kg: autBumper25kg,
                      ),
                      Container(
                        height: 200,
                        child: Center(
                          child: Text(
                            '${botonPress.toString()}%',
                            style: TextStyle(
                              color: Color(0xFF255141).withOpacity(0.1),
                              fontSize: 150,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //DATOS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${((botonPress * (k100lbs * transfKlLb)) / 100).toInt()} kg | '
                        '${((botonPress * k100lbs) / 100).toInt()} lb',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      //FALTA EL AMBOS*****
                      widget.usuario1.chosenValueTD == 'Libras (lb)'
                          ? Text('LIBRAS',
                              style: TextStyle(color: Colors.white))
                          : Text('KILOS',
                              style: TextStyle(color: Colors.white)),
                      widget.usuario1.chosenValueTB == '45 lb'
                          ? Text('45 lb', style: TextStyle(color: Colors.white))
                          : Text('35 lb',
                              style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void colocarDiscos(int resultado, String tipoDiscos) {
    if (tipoDiscos == 'Libras (lb)') {
      while (resultado > 0) {
        if (resultado >= 90) {
          autBumper45lbs = autBumper45lbs + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 90;
          resultado = resultado - 90;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable45lb = 1;
        }

        if (resultado >= 70 && resultado < 90) {
          autBumper35lbs = autBumper35lbs + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 70;
          resultado = resultado - 70;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable35lb = 1;
        }

        if (resultado >= 50 && resultado < 70) {
          autBumper25lbs = autBumper25lbs + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 50;
          resultado = resultado - 50;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable25lb = 1;
        }

        if (resultado >= 30 && resultado < 50) {
          autBumper15lbs = autBumper15lbs + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 30;
          resultado = resultado - 30;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable15lb = 1;
        }
        if (resultado >= 20 && resultado < 30) {
          autBumper10lbs = autBumper10lbs + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 20;
          resultado = resultado - 20;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable10lb = 1;
        }
        if (resultado >= 11 && resultado < 20) {
          autFrac25kg = autFrac25kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 11;
          resultado = resultado - 11;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc25kg = 1;
        }
        if (resultado >= 8 && resultado < 11) {
          autFrac2kg = autFrac2kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 8;
          resultado = resultado - 8;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc2kg = 1;
        }
        if (resultado >= 6 && resultado < 8) {
          autFrac15kg = autFrac15kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 6;
          resultado = resultado - 6;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc15kg = 1;
        }
        if (resultado >= 4 && resultado < 6) {
          autFrac1kg = autFrac1kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 4;
          resultado = resultado - 4;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc1kg = 1;
        }
        if (resultado >= 2 && resultado < 4) {
          autFrac05kg = autFrac05kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 2;
          resultado = resultado - 2;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc05kg = 1;
        }
        if (resultado > 0 && resultado < 2) {
          resultado = 0;
        }
      }
    }
    if (tipoDiscos == 'Kilos (kg)') {
      while (resultado > 0) {
        if (resultado >= 50) {
          autBumper25kg = autBumper25kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 50;
          resultado = resultado - 50;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable25kg = 1;
        }

        if (resultado >= 40 && resultado < 50) {
          autBumper20kg = autBumper20kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 40;
          resultado = resultado - 40;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable20kg = 1;
        }

        if (resultado >= 30 && resultado < 40) {
          autBumper15kg = autBumper15kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 30;
          resultado = resultado - 30;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable15kg = 1;
        }

        if (resultado >= 20 && resultado < 30) {
          autBumper10kg = autBumper10kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 20;
          resultado = resultado - 20;
          autContadorDiscos = autContadorDiscos + 2;
          autVariable10kg = 1;
        }
        if (resultado >= 10 && resultado < 20) {
          autFrac5kg = autFrac5kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 10;
          resultado = resultado - 10;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc25kg = 1;
        }

        if (resultado >= 5 && resultado < 10) {
          autFrac25kg = autFrac25kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 5;
          resultado = resultado - 5;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc25kg = 1;
        }
        if (resultado >= 4 && resultado < 5) {
          autFrac2kg = autFrac2kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 4;
          resultado = resultado - 4;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc2kg = 1;
        }
        if (resultado >= 3 && resultado < 4) {
          autFrac15kg = autFrac15kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 3;
          resultado = resultado - 3;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc15kg = 1;
        }
        if (resultado >= 2 && resultado < 3) {
          autFrac1kg = autFrac1kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 2;
          resultado = resultado - 2;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc1kg = 1;
        }
        if (resultado >= 1 && resultado < 2) {
          autFrac05kg = autFrac05kg + 2;
          autBarraOlimpicalbs = autBarraOlimpicalbs + 1;
          resultado = resultado - 1;
          autContadorDiscos = autContadorDiscos + 2;
          autVarfracc05kg = 1;
        }
        if (resultado > 0 && resultado < 1) {
          resultado = 0;
        }
      }
    }
  }

  void reinicioPesos() {
    autContadorDiscos = 0;
    autBumper10lbs = 0;
    autBumper15lbs = 0;
    autBumper25lbs = 0;
    autBumper35lbs = 0;
    autBumper45lbs = 0;
    autBumper10kg = 0;
    autBumper15kg = 0;
    autBumper20kg = 0;
    autBumper25kg = 0;
    autFrac05kg = 0;
    autFrac1kg = 0;
    autFrac15kg = 0;
    autFrac2kg = 0;
    autFrac25kg = 0;
    autFrac5kg = 0;
    autVariable10lb = 0;
    autVariable15lb = 0;
    autVariable25lb = 0;
    autVariable35lb = 0;
    autVariable45lb = 0;
    autVariable10kg = 0;
    autVariable15kg = 0;
    autVariable20kg = 0;
    autVariable25kg = 0;
    autVarfracc05kg = 0;
    autVarfracc1kg = 0;
    autVarfracc15kg = 0;
    autVarfracc2kg = 0;
    autVarfracc25kg = 0;
    autVarfracc5kg = 0;
    resultado = 0;
  }
}
