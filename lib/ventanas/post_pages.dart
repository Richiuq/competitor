import 'package:competitor/usuarios.dart';
import 'package:competitor/ventanas/perfilcomunidad_page.dart';
import 'package:competitor/ventanas/validacionmov_page.dart';
import 'package:competitor/widgets/cuadroInicio.dart';
import 'package:competitor/widgets/cuadrovalida.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    Key? key,
    required this.listaPostUsers,
  }) : super(key: key);

  final List<PostFB> listaPostUsers;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    widget.listaPostUsers.sort((b, a) {
      return (a.fechaPost!).compareTo(b.fechaPost!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600,
        child: ListView.builder(
          itemCount: widget.listaPostUsers.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                widget.listaPostUsers[index].nombreFoto != '0'
                    ? CuadroInicio(
                        index: index,
                        urlImage: '${widget.listaPostUsers[index].urlImage}',
                        nombrePerfil:
                            '${widget.listaPostUsers[index].nombrePerfil}',
                        nombreFoto:
                            '${widget.listaPostUsers[index].nombreFoto}',
                        perfilPress: () {
                          setState(() {
                            /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PerfilComunidadPage(
                            usuario1: widget.usuario1,
                            usuarioTotal: widget.usuariosTotales[index],
                            boxes: widget.boxes,
                          ),
                        ),
                      );*/
                          });
                        },
                        nombreFotoPerfil:
                            '${widget.listaPostUsers[index].nombreFotoPerfil}',
                      )
                    : CuadroValida(
                        nombrePerfil:
                            '${widget.listaPostUsers[index].nombrePerfil}',
                        nombreFotoPerfil:
                            '${widget.listaPostUsers[index].nombreFotoPerfil}',
                        perfilPress: () {
                          setState(() {
                            /*showDialog(
                            context: context,
                            builder: (context) {
                              return ValidacionMovPage();
                            });*/
                          });
                        },
                        nombreVideo:
                            '${widget.listaPostUsers[index].nombreVideo}',
                        tipoVideo: '${widget.listaPostUsers[index].tipoVideo}',
                        pesoVideo: '${widget.listaPostUsers[index].pesoVideo}',
                        lbkgVideo: '${widget.listaPostUsers[index].lbkgVideo}',
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
