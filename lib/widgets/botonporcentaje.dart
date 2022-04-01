import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class BotonPorcentaje extends StatelessWidget {
  const BotonPorcentaje(
      {Key? key,
      required this.onTap,
      required this.k100lbs,
      required this.porcentaje,
      required this.porcentajeelegido,
      required this.botonPress,
      required this.tapDown,
      required this.tapUp,required this.scale})
      : super(key: key);

  final Function() onTap;
  final int k100lbs;
  final double porcentaje;
  final int porcentajeelegido;
  final int botonPress;
  final Function(TapDownDetails) tapDown;
  final Function(TapUpDetails) tapUp;
  final double scale;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: tapDown,
      onTapUp: tapUp,
      onTap: onTap,
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: 110,
          height: 80,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
            color: botonPress == porcentajeelegido ? colorVerde : Colors.white,
            boxShadow: botonPress == porcentajeelegido ? [shadowBoxesInicio] : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${porcentajeelegido}%',
                style: botonPress == porcentajeelegido
                    ? porcentajePressStyle
                    : porcentajeNoPressStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${(k100lbs * transfKlLb * porcentaje).toInt().toString()}',
                    style: botonPress == porcentajeelegido
                        ? botonPressPorcStyle
                        : botonNoPressPorcStyle,
                  ),
                  Text(
                    'kg',
                    style: botonPress == porcentajeelegido
                        ? kglbpresionadoStyle
                        : kglbnopresionadoStyle,
                  ),
                  Text(
                    ' | ',
                    style: botonPress == porcentajeelegido
                        ? kglbpresionadoStyle
                        : kglbnopresionadoStyle,
                  ),
                  Text(
                    '${(k100lbs * porcentaje).toInt().toString()}',
                    style: botonPress == porcentajeelegido
                        ? botonPressPorcStyle
                        : botonNoPressPorcStyle,
                  ),
                  Text(
                    'lb',
                    style: botonPress == porcentajeelegido
                        ? kglbpresionadoStyle
                        : kglbnopresionadoStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
