import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class BumperAutFracc extends StatelessWidget {
  BumperAutFracc(
      {required this.peso,
        required this.pesoTexto,
        required this.colorBumper,});

  final String pesoTexto;
  final int peso;
  final Color colorBumper;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: colorBumper,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                pesoTexto,
                style: pesoTexto == '5kg' ? TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold) : textoDiscoPeqStyle,
              ),
            ),
          ),
        ),
        Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(4, 12, 4, 4),
            child: Text(
              'x${peso.toString()}',
              style: textoDiscoStyle,
            ),
          ),
        ),
      ],
    );
  }
}
