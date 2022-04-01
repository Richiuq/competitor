import 'package:competitor/constantes.dart';
import 'package:competitor/usuarios.dart';
import 'package:flutter/material.dart';

class CuadroBox extends StatelessWidget {
  const CuadroBox(
      {Key? key, required this.index, required this.box, required this.onPress})
      : super(key: key);

  final int index;
  final BoxGimnasioFB box;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(7, 10, 5, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorVerde),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(4, 4, 5, 4),
              child: Text(
                '${(index) + 1}',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 35,
              width: 35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  '${box.nombreFotoBox}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 4, 4, 4),
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${box.nombreBox}',
                    style: TextStyle(
                        color: colorVerde,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      Text(
                        '15 min ',
                        style: TextStyle(color: colorVerde, fontSize: 10),
                      ),
                      Icon(
                        Icons.directions_bike,
                        size: 14,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 30,
              child: Icon(
                Icons.arrow_upward_outlined,
                size: 30,
                color: Colors.green,
              ),
            ),
/*            Container(
              width: 100,
              child: Text(
                '+RM ${(int.parse('${usuario1.pesoCleanJerk}') + int.parse('${usuario1.pesoCleanJerk}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
