import 'package:competitor/constantes.dart';
import 'package:competitor/usuarios.dart';
import 'package:flutter/material.dart';



class CuadroRanking extends StatelessWidget {
  const CuadroRanking(
      {Key? key,
      required this.usuario1,
      required this.onPress,
      required this.index,
      required this.dropdownValue})
      : super(key: key);

  final UsuarioFB usuario1;
  final Function() onPress;
  final int index;
  final String dropdownValue;

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
                )),
            Container(
              height: 35,
              width: 35,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    '${usuario1.nombreFotoPerfil}',
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 4, 4, 4),
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${usuario1.nombrePerfil}',
                    style: TextStyle(
                        color: colorVerde,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${usuario1.boxPerfil}',
                    style: TextStyle(color: colorVerde, fontSize: 10),
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
            Container(
              width: 90,
              child: dropdownValue == 'Total Olímpico' ? Text(
                '+RM ${(int.parse('${usuario1.pesoCleanJerk}') + int.parse('${usuario1.pesoSnatch}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ) : dropdownValue == 'Clean & Jerk' ? Text(
                '+RM ${(int.parse('${usuario1.pesoCleanJerk}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ) : dropdownValue == 'Snatch' ? Text(
                '+RM ${(int.parse('${usuario1.pesoSnatch}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ) :dropdownValue == 'Clean' ? Text(
                '+RM ${(int.parse('${usuario1.pesoClean}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ) :dropdownValue == 'Deadlift' ? Text(
                '+RM ${(int.parse('${usuario1.pesoDeadlift}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ) :dropdownValue == 'FrontSquat' ? Text(
                '+RM ${(int.parse('${usuario1.pesoFrontSquat}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ) :dropdownValue == 'BackSquat' ? Text(
                '+RM ${(int.parse('${usuario1.pesoBackSquat}'))} kg',
                style: TextStyle(
                    color: colorVerde,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ) : Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
