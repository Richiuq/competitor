import 'package:competitor/constantes.dart';
import 'package:competitor/widgets/bumper_aut_fracc.dart';
import 'package:competitor/widgets/bumper_autom.dart';
import 'package:flutter/material.dart';

class DiscosCargados extends StatelessWidget {
  const DiscosCargados(
      {Key? key,
      required this.autFrac05kg,
      required this.autFrac1kg,
      required this.autFrac15kg,
      required this.autFrac2kg,
      required this.autFrac25kg,
      required this.autFrac5kg,
      required this.autBumper10lbs,
      required this.autBumper15lbs,
      required this.autBumper25lbs,
      required this.autBumper35lbs,
      required this.autBumper45lbs,
      required this.autBumper10kg,
      required this.autBumper15kg,
      required this.autBumper20kg,
      required this.autBumper25kg})
      : super(key: key);

  final int autFrac05kg;
  final int autFrac1kg;
  final int autFrac15kg;
  final int autFrac2kg;
  final int autFrac25kg;
  final int autFrac5kg;
  final int autBumper10lbs;
  final int autBumper15lbs;
  final int autBumper25lbs;
  final int autBumper35lbs;
  final int autBumper45lbs;
  final int autBumper10kg;
  final int autBumper15kg;
  final int autBumper20kg;
  final int autBumper25kg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          autBumper25kg == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.red,
            peso: autBumper25kg,
            pesoTexto: '25kg',
          ),
          autBumper45lbs == 0
              ? Text('')
              : BumperAutom(
                  colorBumper: Colors.black,
                  peso: autBumper45lbs,
                  pesoTexto: '45lb',
                ),
          autBumper20kg == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.blue,
            peso: autBumper20kg,
            pesoTexto: '20kg',
          ),
          autBumper35lbs == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.black,
            peso: autBumper35lbs,
            pesoTexto: '35lb',
          ),
          autBumper15kg == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.yellow,
            peso: autBumper15kg,
            pesoTexto: '15kg',
          ),
          autBumper25lbs == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.black,
            peso: autBumper25lbs,
            pesoTexto: '25lb',
          ),
          autBumper10kg == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.green,
            peso: autBumper10kg,
            pesoTexto: '10kg',
          ),
          autBumper15lbs == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.black,
            peso: autBumper15lbs,
            pesoTexto: '15lb',
          ),
          autBumper10lbs == 0
              ? Text('')
              : BumperAutom(
            colorBumper: Colors.black,
            peso: autBumper10lbs,
            pesoTexto: '10lb',
          ),
          autFrac5kg == 0
              ? Text('')
              : BumperAutFracc(
            colorBumper: Colors.white,
            peso: autFrac5kg,
            pesoTexto: '5kg',
          ),
          autFrac25kg == 0
              ? Text('')
              : BumperAutFracc(
            colorBumper: Colors.red,
            peso: autFrac25kg,
            pesoTexto: '2.5kg',
          ),
          autFrac2kg == 0
              ? Text('')
              : BumperAutFracc(
            colorBumper: Colors.blue,
            peso: autFrac2kg,
            pesoTexto: '2kg',
          ),
          autFrac15kg == 0
              ? Text('')
              : BumperAutFracc(
            colorBumper: Colors.yellow,
            peso: autFrac15kg,
            pesoTexto: '1.5kg',
          ),
          autFrac1kg == 0
              ? Text('')
              : BumperAutFracc(
            colorBumper: Colors.green,
            peso: autFrac1kg,
            pesoTexto: '1kg',
          ),
          autFrac05kg == 0
              ? Text('')
              : BumperAutFracc(
            colorBumper: Colors.white30,
            peso: autFrac05kg,
            pesoTexto: '.5kg',
          ),
        ],
      ),
    );
  }
}
