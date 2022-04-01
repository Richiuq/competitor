import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:competitor/constantes.dart';
import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/perfilcomunidad_page.dart';
import 'package:competitor/widgets/roundranking.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({
    Key? key,
    required this.usuariosTotales,
    required this.usuario1,
  }) : super(key: key);

  final List<UsuarioFB> usuariosTotales;
  final UsuarioFB usuario1;

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  String dropdownValue = 'Total Olímpico';
  List<Foto> listFotosPerfil = [];
  List<Video> listVideoPerfil = [];

  @override
  void initState() {
    widget.usuariosTotales.sort((b, a) {
      return (int.parse(a.pesoCleanJerk!) + int.parse(a.pesoSnatch!))
          .compareTo(int.parse(b.pesoCleanJerk!) + int.parse(b.pesoSnatch!));
    });
    super.initState();
  }

  ordenLista(String dropdownValue) {
    setState(() {
      if (dropdownValue == 'Total Olímpico') {
        widget.usuariosTotales.sort((b, a) {
          return (int.parse(a.pesoCleanJerk!) + int.parse(a.pesoSnatch!))
              .compareTo(
                  int.parse(b.pesoCleanJerk!) + int.parse(b.pesoSnatch!));
        });
      }
      if (dropdownValue == 'Clean & Jerk') {
        widget.usuariosTotales.sort((b, a) {
          return int.parse(a.pesoCleanJerk!)
              .compareTo(int.parse(b.pesoCleanJerk!));
        });
      }
      if (dropdownValue == 'Snatch') {
        widget.usuariosTotales.sort((b, a) {
          return int.parse(a.pesoSnatch!).compareTo(int.parse(b.pesoSnatch!));
        });
      }
      if (dropdownValue == 'Clean') {
        widget.usuariosTotales.sort((b, a) {
          return int.parse(a.pesoClean!).compareTo(int.parse(b.pesoClean!));
        });
      }
      if (dropdownValue == 'Deadlift') {
        widget.usuariosTotales.sort((b, a) {
          return int.parse(a.pesoDeadlift!)
              .compareTo(int.parse(b.pesoDeadlift!));
        });
      }
      if (dropdownValue == 'FrontSquat') {
        widget.usuariosTotales.sort((b, a) {
          return int.parse(a.pesoFrontSquat!)
              .compareTo(int.parse(b.pesoFrontSquat!));
        });
      }
      if (dropdownValue == 'BackSquat') {
        widget.usuariosTotales.sort((b, a) {
          return int.parse(a.pesoBackSquat!)
              .compareTo(int.parse(b.pesoBackSquat!));
        });
      }
    });
  }

  Future buscarPerfilPress(BuildContext context, UsuarioFB usuarioFB) async {
    listFotosPerfil.clear();
    listVideoPerfil.clear();

    await FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        FirebaseFirestore.instance
            .collection('BoxGimnasio')
            .doc(result.get('nombreBox'))
            .collection('Usuarios')
            .get()
            .then((querySnapshot2) {
          querySnapshot2.docs.forEach((result2) {
            if (usuarioFB.correoPerfil == result2.get('correoPerfil')) {
              print(result2.get('correoPerfil'));
              UsuarioFB userPerfil = UsuarioFB(
                result2.get('nombrePerfil'),
                result2.get('nombreFotoPerfil'),
                result2.get('correoPerfil'),
                result2.get('contrasenaPerfil'),
                result2.get('boxPerfil'),
                result2.get('presentPerfil'),
                result2.get('pesoCleanJerk'),
                result2.get('pesoSnatch'),
                result2.get('pesoClean'),
                result2.get('pesoDeadlift'),
                result2.get('pesoBackSquat'),
                result2.get('pesoFrontSquat'),
                result2.get('chosenValueTD'),
                result2.get('chosenValueTB'),
              );
              FirebaseFirestore.instance
                  .collection('BoxGimnasio')
                  .doc(result.get('nombreBox'))
                  .collection('Usuarios')
                  .doc(usuarioFB.correoPerfil)
                  .collection('Foto')
                  .get()
                  .then((querySnapshot3) {
                querySnapshot3.docs.forEach((result3) {
                  Foto fotosPerfil = Foto(
                    result3.get('nombreFoto'),
                    result3.get('urlImage'),
                  );
                  if(fotosPerfil.nombreFoto != '1') {
                    listFotosPerfil.add(fotosPerfil);
                  }
                });
              });
              FirebaseFirestore.instance
                  .collection('BoxGimnasio')
                  .doc(result.get('nombreBox'))
                  .collection('Usuarios')
                  .doc(usuarioFB.correoPerfil)
                  .collection('Video')
                  .get()
                  .then((querySnapshot4) {
                querySnapshot4.docs.forEach((result4) {
                  Video videosPerfil = Video(
                    result4.get('nombreVideo'),
                    result4.get('linkVideo'),
                    result4.get('cantRep'),
                    result4.get('cantNoRep'),
                    result4.get('tipoVideo'),
                    result4.get('pesoVideo'),
                    result4.get('lbkgVideo'),
                  );
                  if(videosPerfil.nombreVideo != '1'){
                    listVideoPerfil.add(videosPerfil);
                  }
                });
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerfilComunidadPage(
                    usuario1: widget.usuario1,
                    usuarioTotal: usuarioFB,
                    listVideosPerfil: listVideoPerfil,
                    listFotosPerfil: listFotosPerfil,
                  ),
                ),
              );
              print('INGRESADO CORRECTAMENTE');
            }
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        color: colorVerde,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorVerde),
              color: Colors.white,
            ),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: colorVerde,
                  size: 20,
                ),
              ),
              elevation: 16,
              style: TextStyle(color: colorVerde),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                  ordenLista(dropdownValue);
                });
              },
              items: <String>[
                'Total Olímpico',
                'Clean & Jerk',
                'Snatch',
                'Clean',
                'Deadlift',
                'FrontSquat',
                'BackSquat',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: widget.usuariosTotales.length,
                itemBuilder: (context, index) {
                  //final item = widget.usuariosTotales[index];
                  return ListTile(
                    title: CuadroRanking(
                      usuario1: widget.usuariosTotales[index],
                      onPress: () {
                        setState(() {
                          buscarPerfilPress(context, widget.usuariosTotales[index]);
                        });
                      },
                      index: index,
                      dropdownValue: dropdownValue,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
