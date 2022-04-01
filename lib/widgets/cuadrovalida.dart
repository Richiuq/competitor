import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class CuadroValida extends StatelessWidget {
  const CuadroValida(
      {Key? key,
      required this.nombrePerfil,
      required this.nombreFotoPerfil,
      required this.perfilPress,
      required this.nombreVideo,
      required this.lbkgVideo,
      required this.tipoVideo,
      required this.pesoVideo})
      : super(key: key);

  final String nombrePerfil;
  final String nombreFotoPerfil;
  final String nombreVideo;
  final String lbkgVideo;
  final String tipoVideo;
  final String pesoVideo;
  final Function() perfilPress;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Duration fechaPost = now.difference(DateTime.parse(nombreVideo));

    return GestureDetector(
      onTap: perfilPress,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white),
          boxShadow: [shadowBoxesInicio],
          color: colorVerde,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(color: Colors.green, width: 3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.network(
                          nombreFotoPerfil,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (nombrePerfil),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Hace ${fechaPost.inDays} días ${fechaPost.inHours - (fechaPost.inDays) * 24} hrs y ${fechaPost.inMinutes - (fechaPost.inDays) * 24 * 60 - (fechaPost.inHours - (fechaPost.inDays) * 24) * 60} min',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.white,
                  size: 24.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'JUEZEA! $tipoVideo $pesoVideo $lbkgVideo',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
