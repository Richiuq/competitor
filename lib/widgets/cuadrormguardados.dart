import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class CuadroRMGuardados extends StatelessWidget {
  const CuadroRMGuardados(
      {Key? key,
      required this.onTap,
      required this.pesoPresionado,
      required this.tipoPeso,
      required this.pesoPerfil,
      required this.fotoMov,
      required this.tapDown,
      required this.tapUp,
      required this.scale})
      : super(key: key);

  final Function() onTap;
  final Function(TapDownDetails) tapDown;
  final Function(TapUpDetails) tapUp;
  final String pesoPresionado;
  final String tipoPeso;
  final int pesoPerfil;
  final double scale;
  final String fotoMov;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: tapDown,
      onTapUp: tapUp,
      onTap: onTap,
      child: Transform.scale(
        scale: scale,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              height: 160,
              width: pesoPresionado == tipoPeso ? 150 : 120,
              decoration: pesoPresionado == tipoPeso
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: colorVerde),
                      boxShadow: [shadowBoxesInicio],
                      color: colorVerde,
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white),
                      color: colorVerde,
                    ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  //'https://www.crossfitinvictus.com/wp-content/uploads/2020/01/Front_Squats-1-1024x621.jpg',
                  fotoMov,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$tipoPeso',
                    style: pesoPresionado == tipoPeso
                        ? botonPressStyle
                        : botonNoPressStyle,
                  ),
                  Text(
                    '${(pesoPerfil * transfKlLb).toInt()}kg\n${pesoPerfil}lb',
                    style: pesoPresionado == tipoPeso
                        ? botonPressStyle
                        : botonNoPressStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
