import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class CuadroRMPerfil extends StatelessWidget {
  const CuadroRMPerfil(
      {Key? key,
      required this.onPress,
      required this.tipoPeso})
      : super(key: key);

  final Function() onPress;
  final String tipoPeso;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
            height: 180,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.white),
              color: colorVerde,
            ),
            child:  /*ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://www.crossfitinvictus.com/wp-content/uploads/2020/01/Front_Squats-1-1024x621.jpg',
                      fit: BoxFit.cover,
                    ),
                  )*/
                Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Center(
                      child: Icon(
                        Icons.add_a_photo_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
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
                  style: botonNoPressStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
