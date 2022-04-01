import 'package:flutter/material.dart';

const inicialStyle = TextStyle(fontSize: 15.0, color: colorVerde, fontWeight: FontWeight.bold);
const iniciasesionlStyle = TextStyle(fontSize: 20.0, color: Colors.white);
const botoniniciaStyle = TextStyle(fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.bold);
const textolinkStyle = TextStyle(fontSize: 10.0, color: colorVerde);
const titulormcompStyle = TextStyle(fontSize: 20.0, color: colorVerde);
const titulormcompStyle2 = TextStyle(fontSize: 15.0, color: Colors.white);
const textormcompStyle = TextStyle(fontSize: 15.0, color: Colors.white);
const botonPressStyle = TextStyle(fontSize: 20.0, color: Colors.white,fontWeight: FontWeight.bold);
const botonNoPressStyle = TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold);
const botonPressPorcStyle = TextStyle(fontSize: 15.0, color: Colors.white);
const botonNoPressPorcStyle = TextStyle(fontSize: 15.0, color: Colors.grey);
const porcentajePressStyle = TextStyle(fontSize: 25.0, color: Colors.white);
const porcentajeNoPressStyle = TextStyle(fontSize: 25.0, color: Colors.grey);
const botonCargarStyle = TextStyle(fontSize: 30.0, color: Colors.white);
const pesoElegidoStyle = TextStyle(fontSize: 40.0, color: colorVerde);
const pesoElegidolbStyle = TextStyle(fontSize: 30.0, color: colorVerde, fontWeight: FontWeight.bold);
const pesoElegidolbchicoStyle = TextStyle(fontSize: 20.0, color: colorVerde);
const textolibrasStyle = TextStyle(fontSize: 25.0, color: colorVerde);
const kglbpresionadoStyle = TextStyle(color: Colors.white,fontSize: 15);
const kglbnopresionadoStyle = TextStyle(color: Colors.grey,fontSize: 15);
const textoDiscoStyle = TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold);
const textoDiscoPeqStyle = TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold);
const transfKlLb = 0.453592;
const colorVerde = Color(0xFF255141);
const colorVerdeOsc = Color(0xFF003D40);
BoxShadow shadowBoxesInicio = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 5,
  blurRadius: 7,
  offset: Offset(0, 3), // changes position of shadow
);


Widget kBumper10lb = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 10,
    height: 45,
    color: Colors.black,
  ),
);

Widget kBumper15lb = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 12,
    height: 45,
    color: Colors.black,
  ),
);

Widget kBumper25lb = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 13,
    height: 45,
    color: Colors.black,
  ),
);

Widget kBumper35lb = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 16,
    height: 45,
    color: Colors.black,
  ),
);

Widget kBumper45lb = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 17,
    height: 45,
    color: Colors.black,
  ),
);

Widget kBumper10kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 13,
    height: 45,
    color: Colors.green,
  ),
);

Widget kBumper15kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 14,
    height: 45,
    color: Colors.yellow,
  ),
);

Widget kBumper20kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 16,
    height: 45,
    color: Colors.blue,
  ),
);

Widget kBumper25kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 17,
    height: 45,
    color: Colors.red,
  ),
);

Widget kbumFracc05kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 12,
    height: 20,
    color: Colors.black,
  ),
);

Widget kbumFracc1kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 12,
    height: 20,
    color: Colors.green,
  ),
);

Widget kbumFracc15kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 12,
    height: 20,
    color: Colors.yellow,
  ),
);

Widget kbumFracc2kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 12,
    height: 20,
    color: Colors.blue,
  ),
);

Widget kbumFracc25kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 12,
    height: 20,
    color: Colors.red,
  ),
);

Widget kbumFracc5kg = Container(
  margin: const EdgeInsets.all(1),
  child: Container(
    width: 12,
    height: 25,
    color: Colors.grey,
  ),
);

/*ListWheelScrollView.useDelegate(
                    itemExtent: 30.0,
                    useMagnifier: true,
                    magnification: 1.5,
                    overAndUnderCenterOpacity: 1,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Container(
                          width:MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                index.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    onSelectedItemChanged: (index) => {
                      setState(() {
                        _selectedItemIndex = index;
                        k100lbs = (_selectedItemIndex) * 1;
                        //print(_selectedItemIndex);
                      })
                    },
                  ),*/

/*ListWheelScrollView(
                    itemExtent: 30,
                    useMagnifier: true,
                    magnification: 0.5,
                    physics: FixedExtentScrollPhysics(),
                    diameterRatio: 0.9,
                    //perspective: 0.001,
                    onSelectedItemChanged: (index) => {
                      setState(() {
                        _selectedItemIndex = index;
                        k100lbs = (_selectedItemIndex+1) * 1;
                        //print(_selectedItemIndex);
                      })
                    },
                    children: [
                      for (var i = 1; i < 500; i++)
                        Text(
                          '$i lb / ${i + 40} kg',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                    ],
                  ),*/