import 'package:competitor/constantes.dart';
import 'package:flutter/material.dart';

class ValidacionMovPage extends StatefulWidget {
  const ValidacionMovPage({Key? key}) : super(key: key);

  @override
  State<ValidacionMovPage> createState() => _ValidacionMovPageState();
}

class _ValidacionMovPageState extends State<ValidacionMovPage> {
  bool repPress = true;

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
            //TITULO
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                border: Border.all(color: colorVerde),
                color: colorVerde,
              ),
              child: const Center(
                child: Text(
                  'Validación de ejercicio',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //GIF + DESCRIPCION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: Image.network('https://i.gifer.com/9Tt9.gif'),
                ),
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clean &\nJerk',
                        style: TextStyle(
                            color: colorVerde,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '100 kg\n220 lb',
                        style: TextStyle(
                            color: colorVerde,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //DETALLE VALIDEZ
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: 260,
              child: Text(
                'La repetición esa válida cuando se levanta del\nsuelo y se produce extensión total de caderas',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            //VIDEO PERFIL
            Container(
              height: 120,
              width: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.gifer.com/6yZv.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //BOTONES REP NO REP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      repPress = true;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: repPress
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: colorVerde,
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'REP',
                            style: TextStyle(
                                color: repPress ? Colors.white : colorVerde),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.check,
                            size: 15,
                            color: repPress ? Colors.white : colorVerde,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      repPress = false;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: repPress
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: colorVerde,
                          ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'NO REP',
                            style: TextStyle(
                                color: repPress ? colorVerde : Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.close,
                            size: 15,
                            color: repPress ? colorVerde : Colors.white,
                          ),
                        ],
                      ),
                    ),
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
