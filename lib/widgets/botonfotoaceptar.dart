import 'dart:io';

import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BotonFotoAceptar extends StatelessWidget {
  const BotonFotoAceptar(
      {Key? key, required this.onPress, required this.fotoUpload})
      : super(key: key);

  final Function() onPress;
  final File fotoUpload;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: colorVerde,
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Image.file(
                fotoUpload,
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              onTap: onPress,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white),
                  color: colorVerde,
                ),
                height: 30,
                width: 100,
                child: Text(
                  'Aceptar',
                  style: botoniniciaStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
