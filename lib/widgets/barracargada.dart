import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class BarraCargada extends StatelessWidget {
  const BarraCargada(
      {Key? key,
      required this.k100lbs,
      required this.botonPress,
      required this.barra,
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

  final int k100lbs;
  final int botonPress;
  final String barra;
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
      margin: EdgeInsets.all(10),
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorVerde),
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              autFrac05kg == 2
                  ? kbumFracc05kg
                  : autFrac05kg == 4
                      ? Row(children: [
                          kbumFracc05kg,
                          kbumFracc05kg,
                        ])
                      : Text(''),
              autFrac1kg == 2
                  ? kbumFracc1kg
                  : autFrac1kg == 4
                      ? Row(children: [
                          kbumFracc1kg,
                          kbumFracc1kg,
                        ])
                      : Text(''),
              autFrac15kg == 2
                  ? kbumFracc15kg
                  : autFrac15kg == 4
                      ? Row(children: [
                          kbumFracc15kg,
                          kbumFracc15kg,
                        ])
                      : Text(''),
              autFrac2kg == 2
                  ? kbumFracc2kg
                  : autFrac2kg == 4
                      ? Row(children: [
                          kbumFracc2kg,
                          kbumFracc2kg,
                        ])
                      : Text(''),
              autFrac25kg == 2
                  ? kbumFracc25kg
                  : autFrac25kg == 4
                      ? Row(children: [
                          kbumFracc25kg,
                          kbumFracc25kg,
                        ])
                      : Text(''),
              autFrac5kg == 2
                  ? kbumFracc5kg
                  : autFrac5kg == 4
                      ? Row(children: [
                          kbumFracc5kg,
                          kbumFracc5kg,
                        ])
                      : Text(''),
              autBumper10lbs == 2
                  ? kBumper10lb
                  : autBumper10lbs == 4
                      ? Row(children: [
                          kBumper10lb,
                          kBumper10lb,
                        ])
                      : Text(''),
              autBumper15lbs == 2
                  ? kBumper15lb
                  : autBumper15lbs == 4
                      ? Row(children: [
                          kBumper15lb,
                          kBumper15lb,
                        ])
                      : Text(''),
              autBumper10kg == 2
                  ? kBumper10kg
                  : autBumper10kg == 4
                      ? Row(children: [
                          kBumper10kg,
                          kBumper10kg,
                        ])
                      : Text(''),
              autBumper25lbs == 2
                  ? kBumper25lb
                  : autBumper25lbs == 4
                      ? Row(children: [
                          kBumper25lb,
                          kBumper25lb,
                        ])
                      : Text(''),
              autBumper15kg == 2
                  ? kBumper15kg
                  : autBumper15kg == 4
                      ? Row(children: [
                          kBumper15kg,
                          kBumper15kg,
                        ])
                      : Text(''),
              autBumper35lbs == 2
                  ? kBumper35lb
                  : autBumper35lbs == 4
                      ? Row(children: [
                          kBumper35lb,
                          kBumper35lb,
                        ])
                      : Text(''),
              autBumper20kg == 2
                  ? kBumper20kg
                  : autBumper20kg == 4
                      ? Row(children: [
                          kBumper20kg,
                          kBumper20kg,
                        ])
                      : Text(''),
              autBumper45lbs == 2
                  ? kBumper45lb
                  : autBumper45lbs == 4
                      ? Row(children: [
                          kBumper45lb,
                          kBumper45lb,
                        ])
                      : autBumper45lbs == 6
                          ? Row(children: [
                              kBumper45lb,
                              kBumper45lb,
                              kBumper45lb,
                            ])
                          : Text(''),
              autBumper25kg == 2
                  ? kBumper25kg
                  : autBumper25kg == 4
                      ? Row(children: [
                          kBumper25kg,
                          kBumper25kg,
                        ])
                      : autBumper25kg == 6
                          ? Row(children: [
                              kBumper25kg,
                              kBumper25kg,
                              kBumper25kg,
                            ])
                          : Text(''),
              Container(
                margin: EdgeInsets.fromLTRB(1, 5, 1, 5),
                child: Container(
                  width: 100,
                  height: 10,
                  color: barra == '35 lb' ? Colors.red : Colors.blue,
                ),
              ),
              autBumper25kg == 2
                  ? kBumper25kg
                  : autBumper25kg == 4
                      ? Row(children: [
                          kBumper25kg,
                          kBumper25kg,
                        ])
                      : autBumper25kg == 6
                          ? Row(children: [
                              kBumper25kg,
                              kBumper25kg,
                              kBumper25kg,
                            ])
                          : Text(''),
              autBumper45lbs == 2
                  ? kBumper45lb
                  : autBumper45lbs == 4
                      ? Row(children: [
                          kBumper45lb,
                          kBumper45lb,
                        ])
                      : autBumper45lbs == 6
                          ? Row(children: [
                              kBumper45lb,
                              kBumper45lb,
                              kBumper45lb,
                            ])
                          : Text(''),
              autBumper20kg == 2
                  ? kBumper20kg
                  : autBumper20kg == 4
                      ? Row(children: [
                          kBumper20kg,
                          kBumper20kg,
                        ])
                      : Text(''),
              autBumper35lbs == 2
                  ? kBumper35lb
                  : autBumper35lbs == 4
                      ? Row(children: [
                          kBumper35lb,
                          kBumper35lb,
                        ])
                      : Text(''),
              autBumper15kg == 2
                  ? kBumper15kg
                  : autBumper15kg == 4
                      ? Row(children: [
                          kBumper15kg,
                          kBumper15kg,
                        ])
                      : Text(''),
              autBumper25lbs == 2
                  ? kBumper25lb
                  : autBumper25lbs == 4
                      ? Row(children: [
                          kBumper25lb,
                          kBumper25lb,
                        ])
                      : Text(''),
              autBumper10kg == 2
                  ? kBumper10kg
                  : autBumper10kg == 4
                      ? Row(children: [
                          kBumper10kg,
                          kBumper10kg,
                        ])
                      : Text(''),
              autBumper15lbs == 2
                  ? kBumper15lb
                  : autBumper15lbs == 4
                      ? Row(children: [
                          kBumper15lb,
                          kBumper15lb,
                        ])
                      : Text(''),
              autBumper10lbs == 2
                  ? kBumper10lb
                  : autBumper10lbs == 4
                      ? Row(children: [
                          kBumper10lb,
                          kBumper10lb,
                        ])
                      : Text(''),
              autFrac5kg == 2
                  ? kbumFracc5kg
                  : autFrac5kg == 4
                      ? Row(children: [
                          kbumFracc5kg,
                          kbumFracc5kg,
                        ])
                      : Text(''),
              autFrac25kg == 2
                  ? kbumFracc25kg
                  : autFrac25kg == 4
                      ? Row(children: [
                          kbumFracc25kg,
                          kbumFracc25kg,
                        ])
                      : Text(''),
              autFrac2kg == 2
                  ? kbumFracc2kg
                  : autFrac2kg == 4
                      ? Row(children: [
                          kbumFracc2kg,
                          kbumFracc2kg,
                        ])
                      : Text(''),
              autFrac15kg == 2
                  ? kbumFracc15kg
                  : autFrac15kg == 4
                      ? Row(children: [
                          kbumFracc15kg,
                          kbumFracc15kg,
                        ])
                      : Text(''),
              autFrac1kg == 2
                  ? kbumFracc1kg
                  : autFrac1kg == 4
                      ? Row(children: [
                          kbumFracc1kg,
                          kbumFracc1kg,
                        ])
                      : Text(''),
              autFrac05kg == 2
                  ? kbumFracc05kg
                  : autFrac05kg == 4
                      ? Row(children: [
                          kbumFracc05kg,
                          kbumFracc05kg,
                        ])
                      : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
