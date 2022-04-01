import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class BumperAutom extends StatelessWidget {
  BumperAutom(
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
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(20),
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
                style: textoDiscoStyle,
              ),
            ),
          ),
        ),
Container(
              child: Container(
                margin: EdgeInsets.all(4),
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
