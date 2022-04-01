import 'package:competitor/constantes.dart';
import 'package:competitor/usuarios.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CuadroInicio extends StatelessWidget {
  const CuadroInicio(
      {Key? key,
      required this.index,
      required this.urlImage,
      required this.nombrePerfil,
      required this.nombreFoto,
      required this.perfilPress,
      required this.nombreFotoPerfil})
      : super(key: key);

  final int index;
  final String nombrePerfil;
  final String nombreFotoPerfil;
  final String urlImage;
  final String nombreFoto;
  final Function() perfilPress;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Duration fechaPost = now.difference(DateTime.parse(nombreFoto));

    return GestureDetector(
      onTap: perfilPress,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //FOTO DE PERFIL PEQUEÑA
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
                          '${(nombrePerfil)}',
                          style: TextStyle(
                              color: colorVerde,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Hace ${fechaPost.inDays} días ${fechaPost.inHours - (fechaPost.inDays) * 24} hrs y ${fechaPost.inMinutes - (fechaPost.inDays) * 24 * 60 - (fechaPost.inHours - (fechaPost.inDays) * 24) * 60} min',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.more_horiz_outlined,
                  color: colorVerde,
                  size: 24.0,
                ),
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  '${urlImage}',
                  fit: BoxFit.fill,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.favorite_border,
                    color: colorVerde,
                    size: 24.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: colorVerde,
                    size: 24.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.share_outlined,
                    color: colorVerde,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.all(5), child: Text('DETALLE POST')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
