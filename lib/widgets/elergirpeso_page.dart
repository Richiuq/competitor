import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class ElegirPesoPage extends StatelessWidget {
  const ElegirPesoPage(
      {Key? key,
      required this.onPress,
      required this.controPorcEleg,
      required this.lbPress,
      required this.kgPress,required this.pressLibra})
      : super(key: key);

  final Function() onPress;
  final Function() lbPress;
  final Function() kgPress;
  final bool pressLibra;
  final TextEditingController controPorcEleg;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              margin: EdgeInsets.fromLTRB(10, 15, 10, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: colorVerde),
                color: Colors.white,
              ),
              child: TextField(
                controller: controPorcEleg,
                maxLines: 1,
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: onPress,
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                  color: colorVerde,
                ),
                child: Center(
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
