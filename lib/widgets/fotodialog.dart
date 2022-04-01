import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class FotoDialog extends StatelessWidget {
  const FotoDialog({Key? key, required this.fotoPress, required this.onPress})
      : super(key: key);

  final String fotoPress;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        height: 400,
        child: Column(
          children: [
            Expanded(
              child: Image.network('${fotoPress}'),
            ),
            GestureDetector(
              onTap: onPress,
              child: Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                  color: colorVerde,
                ),
                child: Center(
                  child: Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
