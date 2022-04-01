import 'package:competitor/constantes.dart';
import 'package:competitor/ventanas/ingresaperfil_page.dart';
import 'package:flutter/material.dart';

class BotonAceptar extends StatelessWidget {
  const BotonAceptar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: colorVerde,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Registrate para conocer\nla comunidad!',
              style: TextStyle(color: Colors.white), textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return IngresaPerfilPage();
                    });
              },
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
                  'Registrarse',
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
