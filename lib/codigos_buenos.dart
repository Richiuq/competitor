
/*          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ValidacionMovPage();
                            });
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://www.zonawod.com/wp-content/uploads/clean-and-jerk-crossfit-rich-froning.jpeg'),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Clean &\nJerk',
                                style: botonPressStyle,
                              ),
                              Text(
                                '${(pesoRMCleanJerk * transfKlLb).toInt()}kg\n${pesoRMCleanJerk}lb',
                                style: botonPressStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F35%2F2020%2F04%2F09%2Fhow-to-do-snatch-crossfit.jpg',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Snatch',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMSnatch * transfKlLb).toInt()}kg\n${pesoRMSnatch}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.crossfitinvictus.com/wp-content/uploads/2020/01/Front_Squats-1-1024x621.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clean',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMClean * transfKlLb).toInt()}kg\n${pesoRMClean}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://i0.wp.com/boxjunkies.com/wp-content/uploads/2017/03/Deadlift-crossfit.jpg?w=460&ssl=1'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deadlift',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMDeadlift * transfKlLb).toInt()}kg\n${pesoRMDeadlift}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/female-athlete-exercising-with-barbell-in-gym-royalty-free-image-1569411677.jpg?resize=980:*',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Back\nSquat',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMBackSquat * transfKlLb).toInt()}kg\n${pesoRMBackSquat}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.squarespace-cdn.com/content/v1/5160bb45e4b0e13a258812c8/1448323881710-WBF105CRJ4F3DFBL8ERF/image-asset.jpeg?format=750w'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Front\nSquat',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMFrontSquat * transfKlLb).toInt()}kg\n${pesoRMFrontSquat}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${widget.usuarioTotal.nombreFotoPerfil}'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: colorVerde,
                      */ /*image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/female-athlete-exercising-with-barbell-in-gym-royalty-free-image-1569411677.jpg?resize=980:*',
                        ),
                      ),*/ /*
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: colorVerde,
                      */ /*image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.squarespace-cdn.com/content/v1/5160bb45e4b0e13a258812c8/1448323881710-WBF105CRJ4F3DFBL8ERF/image-asset.jpeg?format=750w'),
                      ),*/ /*
                    ),
                  ),
                ),
              ],
            ),
          ),*/
/*              FirebaseFirestore.instance
                  .collection('BoxGimnasio')
                  .doc(result2.get('boxPerfil'))
                  .collection('Usuarios')
                  .doc(result2.get('correoPerfil'))
                  .collection('Video')
                  .get()
                  .then((querySnapshot4) {
                querySnapshot4.docs.forEach((result4) {
                  Video videosUsuarios = Video(
                    result4.get('nombreVideo'),
                    result4.get('linkVideo'),
                    result4.get('cantRep'),
                    result4.get('cantNoRep'),
                    result4.get('tipoVideo'),
                    result4.get('pesoVideo'),
                    result4.get('lbkgVideo'),
                  );
                  listVideosUsuarios.add(videosUsuarios);
                });
              });*/

/*Text('$now'),
                        Text('${DateTime.parse(tituloPost)}'),
                        Text('${fechaPost.inDays}'),
                        Text('${fechaPost.inHours- (fechaPost.inDays)*24}'),
                        Text('${fechaPost.inMinutes - (fechaPost.inDays)*24*60 - (fechaPost.inHours- (fechaPost.inDays)*24)*60}'),*/

/* for (var i = 0; i < widget.boxes.length; i++) {
      usuariosCantidad = usuariosCantidad + widget.boxes[i].usuariosBox!.length;
      for (var j = 0; j < widget.boxes[i].usuariosBox!.length; j++) {
        usuariosTotales.add(widget.boxes[i].usuariosBox![j]!);
        //print(widget.boxes[i].usuariosBox![j]!.nombrePerfil);
      }
    }*/

/*listVideosPerfilUpload[index].nombreVideo == '1'
                      ? Container(
                          width: 100,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: colorVerde),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_rounded,
                                size: 40,
                                color: colorVerde,
                              ),
                              Text('Sube tú RM',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: colorVerde,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        )
                      : Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              height: 180,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.white),
                                color: colorVerde,
                              ),
                              child: /*ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://www.crossfitinvictus.com/wp-content/uploads/2020/01/Front_Squats-1-1024x621.jpg',
                      fit: BoxFit.cover,
                    ),
                  )*/
                                  Container(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Center(
                                  child: Icon(
                                    Icons.add_a_photo_rounded,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'dfdf',
                                    style: botonNoPressStyle,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),*/

/*FirebaseFirestore.instance
                .collection('BoxGimnasio')
                .doc(boxPerfil)
                .collection('Usuarios')
                .doc(correoPerfil)
                .collection('Foto')
                .doc('Foto1')
                .set({
              'nombreFoto': 'foto1',
              'urlImage': nombreFotoPerfil,
            });*/
/*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PerfilUsuarioPage(
                  usuario1: Usuario(
                      nombrePerfil,
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      contrasPerfil,
                      correoPerfil,
                      boxPerfil,
                      '1',
                      nombreFotoPerfil,
                      '1',
                      '1',
                      [Foto(nombreFotoPerfil, nombreFotoPerfil)]),
                  boxes: [
                    BoxGimnasio(
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      '1',
                      [
                        Usuario(
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            '1',
                            [Foto('1', '1')])
                      ],
                    )
                  ],
                ),
              ),
            );*/

//ESTO LO SACA DE LA LISTA ACTUAL
/*    for (var i = 0; i < boxs.length; i++) {
      for (var j = 0; j < boxs[i].usuariosBox!.length; j++) {
        if (correoPerfil == boxs[i].usuariosBox![j]!.nombrePerfil) {
          usuarioIngresa = boxs[i].usuariosBox![j]!;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VentanaInicial(
                usuarioIngresado: true,
                usuario1: usuarioIngresa,
                boxes: boxs,
              ),
            ),
          );
        }
      }
    }*/

/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Butterfly Video'),
      ),
      body: FutureBuilder(
        future: initPlayer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (isVideoPlaying) {
              _controller?.pause();
            } else {
              _controller?.play();
            }
          });
        },
        child: Icon(
          isVideoPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }*/


/*          //FOTOS PERFIL
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.zonawod.com/wp-content/uploads/clean-and-jerk-crossfit-rich-froning.jpeg'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clean &\nJerk',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMCleanJerk * transfKlLb).toInt()}kg\n${pesoRMCleanJerk}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F35%2F2020%2F04%2F09%2Fhow-to-do-snatch-crossfit.jpg',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Snatch',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMSnatch * transfKlLb).toInt()}kg\n${pesoRMSnatch}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.crossfitinvictus.com/wp-content/uploads/2020/01/Front_Squats-1-1024x621.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clean',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMClean * transfKlLb).toInt()}kg\n${pesoRMClean}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://i0.wp.com/boxjunkies.com/wp-content/uploads/2017/03/Deadlift-crossfit.jpg?w=460&ssl=1'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deadlift',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMDeadlift * transfKlLb).toInt()}kg\n${pesoRMDeadlift}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/female-athlete-exercising-with-barbell-in-gym-royalty-free-image-1569411677.jpg?resize=980:*',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Back\nSquat',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMBackSquat * transfKlLb).toInt()}kg\n${pesoRMBackSquat}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.squarespace-cdn.com/content/v1/5160bb45e4b0e13a258812c8/1448323881710-WBF105CRJ4F3DFBL8ERF/image-asset.jpeg?format=750w'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Front\nSquat',
                              style: botonPressStyle,
                            ),
                            Text(
                              '${(pesoRMFrontSquat * transfKlLb).toInt()}kg\n${pesoRMFrontSquat}lb',
                              style: botonPressStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: colorVerde,
                      */ /*image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${widget.usuario1.nombrePost}'),
                      ),*/ /*
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: colorVerde,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: colorVerde,
                    ),
                  ),
                ),
              ],
            ),
          ),*/

/*FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .doc(widget.usuario1.chosenValueBox)
        .collection('Usuarios')
        .doc(widget.usuario1.correoPerfil)
        .collection('Foto')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Foto fotosUser =
        Foto(result.get('nombreFoto'), result.get('urlImage'));
        listFotosPerfil.add(fotosUser);
      });
      print(listFotosPerfil.length);
    });*/

/*  List<BoxGimnasio> boxs = [
    BoxGimnasio(
        'Gaman Ñuñoa',
        'https://www.centrogaman.cl/wp-content/uploads/elementor/thumbs/logo-gaman-resp-pcl8qlcu4ofkt1n87wfwehuku77jm4qmudshtmevh6.png',
        'Ñuñoa',
        'https://www.centrogaman.cl/wp-content/uploads/2021/10/sucursal-_0004_N%CC%83UN%CC%83OA-5.jpg',
        'https://www.centrogaman.cl/wp-content/uploads/2021/05/gaman_nunoabg-1536x1031.jpg',
        'https://cdn1.picuki.com/hosted-by-instagram/q=0exhNuNYnjBcaS3SYdxKjf8R3+JwWgxSZ60STLepjSVmIR1vLHOapZA0mpCj4yRwKwVlASuRYz1n4YspUl9VDj18OkbdQLSPRD5S6KmdXO7N0Txi8JVjnbwwKnIdYHKs9MIuVwmYdSgIGaYDG7uo+qhT5aGuO1lQpTaEW+oR9z5G7NCnV6xhz580r7WGlxqousoyIDND%7C%7CHg1JU46o9CUqTUHGsv+MfF3pLUqF+dVzPgL6NDhkyblNTwHeTgrP2HKjLrgp7YUjy%7C%7CfXnM9%7C%7C2z6ZpkEGR1OpHealjcQ9I8titj1edkr1vZl4fDobVJKT1VagUN5iLmQsCrjSTbw7WV61nrs9aeked0Hr5PKH8OpfIi9+iiYXoXPJf1DWCdZUq7ydQ74c7OJCctmhYJLQaxIhAng9Q==',
        'https://cdn1.picuki.com/hosted-by-instagram/q=0exhNuNYnjBcaS3SYdxKjf8R3+JwWgxSZ60STLepjSVmIR1vLHOapZA0mpCj4yRwKwVlASuRYz1n54wtV1VZDz17PUDfS7aNSj5R66yeU++qvDFh%7C%7CZ9nkLY8KXMdYnOr9cQoXWOpNWwSDv5PHL%7C%7Clo79UvOa0LGFq8zCXItscywlapZ63W6173pQu9u+QgVy0ptV%7C%7CJzlE+2UyMEgvsNzX5DkFUbLPPM1LpqBjG+Zc3oE65ezRlC27TDgzdUNaPzyGuNrCvtZaogThWjt+%7C%7CmWqGogLEHpP0XCZljcQk8oti4f%7C%7CY8A5n%7C%7CEw7PCHc0czB1pTtBh9iLK2kAzZb0aq2E9f+kPS4bGXR+cT9djmI8uVV9nBnjfXV4DqGooKUn9SVq6EcHyIA6PwOMZaqZhGGKUa0Q3ipQM=',
        'https://www.centrogaman.cl/wp-content/uploads/2021/06/PROYECTO-46-bg-1536x1031.jpg',
        'https://www.centrogaman.cl/wp-content/uploads/2021/10/sucursal-_0001_N%CC%83UN%CC%83OA-2.jpg',
        [
          Usuario(
              'Rodolfo Varas',
              'RX',
              'Libras (lb)',
              '45 lb',
              '255',
              '225',
              '185',
              '330',
              '330',
              '285',
              '1234',
              'riuq@gmail.com',
              'Gaman Ñuñoa',
              'Miembro',
              'https://guiafitness.com/wp-content/uploads/crossfit.jpg',
              'https://guiafitness.com/wp-content/uploads/crossfit.jpg',
              '#liveinAUS', [
            Foto('https://guiafitness.com/wp-content/uploads/crossfit.jpg',
                'https://guiafitness.com/wp-content/uploads/crossfit.jpg')
          ]),
          Usuario(
              'José Luis',
              'RX',
              'Libras (lb)',
              '45 lb',
              '255',
              '225',
              '185',
              '330',
              '330',
              '285',
              '1234',
              'riuq@gmail.com',
              'Gaman Ñuñoa',
              'Miembro',
              'https://guiafitness.com/wp-content/uploads/beneficios-entrenamiento-crossfit.jpg',
              'https://guiafitness.com/wp-content/uploads/beneficios-entrenamiento-crossfit.jpg',
              '#valpolallea', [
            Foto('https://guiafitness.com/wp-content/uploads/crossfit.jpg',
                'https://guiafitness.com/wp-content/uploads/crossfit.jpg')
          ]),
          Usuario(
              'Riuq',
              'RX',
              'Libras (lb)',
              '45 lb',
              '255',
              '225',
              '185',
              '330',
              '330',
              '285',
              '1234',
              'riuq@gmail.com',
              'Gaman Ñuñoa',
              'Miembro',
              'https://21quince9.com/wp-content/uploads/2016/04/julie-foucher-640x330.jpg',
              'https://21quince9.com/wp-content/uploads/2016/04/julie-foucher-640x330.jpg',
              '#unapersonanormalentrenando', [
            Foto('https://guiafitness.com/wp-content/uploads/crossfit.jpg',
                'https://guiafitness.com/wp-content/uploads/crossfit.jpg')
          ]),
        ]),
    BoxGimnasio(
        'Gaman La Reina',
        'https://www.centrogaman.cl/wp-content/uploads/elementor/thumbs/logo-gaman-resp-pcl8qlcu4ofkt1n87wfwehuku77jm4qmudshtmevh6.png',
        'La Reina',
        'https://www.centrogaman.cl/wp-content/uploads/2021/09/sucursal-_0000_lareia-1.jpg',
        'https://www.centrogaman.cl/wp-content/uploads/2021/09/sucursal-_0003_lareia-4.jpg',
        'https://www.centrogaman.cl/wp-content/uploads/2021/09/sucursal-_0004_lareia-5.jpg',
        'https://www.centrogaman.cl/wp-content/uploads/2021/09/sucursal-_0002_lareia-3.jpg',
        'https://lh3.googleusercontent.com/k0kgjIBB8Twsmr93iqPEpj495lAIVm4WgVyKSlnLakbo0_RufxlcyxnOwtTBG7hNjAyrU4VuaJSfMxVT=w1080-h608-p-no-v0',
        'https://www.centrogaman.cl/wp-content/uploads/2021/10/slider2-evento-web-1536x673.jpg',
        [
          Usuario(
              'Usuario4',
              'RX',
              'Libras (lb)',
              '45 lb',
              '100',
              '100',
              '100',
              '100',
              '100',
              '100',
              '1234',
              'riuq@gmail.com',
              'Gaman La Reina',
              'Miembro',
              'https://as01.epimg.net/opinion/imagenes/2021/03/25/blogs/1616709895_608183_1616710347_noticia_normal_recorte1.jpg',
              'https://as01.epimg.net/opinion/imagenes/2021/03/25/blogs/1616709895_608183_1616710347_noticia_normal_recorte1.jpg',
              '#hashtag4', [
            Foto('https://guiafitness.com/wp-content/uploads/crossfit.jpg',
                'https://guiafitness.com/wp-content/uploads/crossfit.jpg')
          ]),
          Usuario(
              'Usuario5',
              'Básico',
              'Ambos (lb/kg)',
              '45 lb',
              '225',
              '202',
              '202',
              '202',
              '202',
              '202',
              '1234',
              'Usuario1@gmail.com',
              'Gaman La Reina',
              'HeadCoach',
              'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/07/18/15634659732891.png',
              'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/07/18/15634659732891.png',
              '#hashtag5', [
            Foto('https://guiafitness.com/wp-content/uploads/crossfit.jpg',
                'https://guiafitness.com/wp-content/uploads/crossfit.jpg')
          ]),
          Usuario(
              'Usuario6',
              'RX',
              'Libras (lb)',
              '45 lb',
              '255',
              '225',
              '185',
              '330',
              '330',
              '285',
              '1234',
              'riuq@gmail.com',
              'Gaman La Reina',
              'Miembro',
              'https://triatletasenred.sport.es/wp-content/uploads/crossfit-1.jpg',
              'https://triatletasenred.sport.es/wp-content/uploads/crossfit-1.jpg',
              '#hashtag6', [
            Foto('https://guiafitness.com/wp-content/uploads/crossfit.jpg',
                'https://guiafitness.com/wp-content/uploads/crossfit.jpg')
          ]),
          Usuario(
              'Usuario7',
              'RX',
              'Libras (lb)',
              '45 lb',
              '80',
              '80',
              '80',
              '80',
              '80',
              '80',
              '80',
              'riuq@gmail.com',
              'Gaman La Reina',
              'Miembro',
              'https://triatletasenred.sport.es/wp-content/uploads/crossfit-1.jpg',
              'https://triatletasenred.sport.es/wp-content/uploads/crossfit-1.jpg',
              '#hashtag6', [
            Foto('https://guiafitness.com/wp-content/uploads/crossfit.jpg',
                'https://guiafitness.com/wp-content/uploads/crossfit.jpg')
          ]),
        ]),
  ];*/

/*    FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .doc(widget.usuario1.chosenValueBox)
        .collection('Usuario')
        .doc(widget.usuario1.correoPerfil)
        .collection('Foto')
        .snapshots()
        .listen((event) {
      listFotosPerfil = event.docs
          .map(
            (e) => Foto(
              e['nombreFoto'],
              e['urlImage'],
            ),
          )
          .toList();
      setState(() {
        for (Foto listFoto in listFotosPerfil) {
          var mkr = listFotosPerfil.indexOf(listFoto).toInt();
          print(listFotosPerfil[mkr].nombreFoto);
          Foto foto = Foto(
            listFotosPerfil[mkr].nombreFoto,
            listFotosPerfil[mkr].urlImage,
          );
          listFotosPerfil.add(foto);
        }
      });
      //listFotosPerfil.clear();
    });*/

/*    var pesoRMCleanJerkS = widget.usuario1.pesoCleanJerk!;
    var pesoRMSnatchS = widget.usuario1.pesoSnatch!;
    var pesoRMCleanS = widget.usuario1.pesoClean!;
    var pesoRMDeadliftS = widget.usuario1.pesoDeadlift!;
    var pesoRMBackS = widget.usuario1.pesoBackSquat!;
    var pesoRMFrontS = widget.usuario1.pesoFrontSquat!;
    pesoRMCleanJerk = int.parse(pesoRMCleanJerkS);
    pesoRMSnatch = int.parse(pesoRMSnatchS);
    pesoRMClean = int.parse(pesoRMCleanS);
    pesoRMDeadlift = int.parse(pesoRMDeadliftS);
    pesoRMBackSquat = int.parse(pesoRMBackS);
    pesoRMFrontSquat = int.parse(pesoRMFrontS);
    pesoRMTotal = pesoRMCleanJerk + pesoRMSnatch;*/

/*
  Widget cargaFoto(String imageName) {
    String urlImage;
    print(imageName);

    urlImage = firebase_storage.FirebaseStorage.instance
        .ref()
        .child(imageName)
        .getDownloadURL()
        .toString();
    print(urlImage);
    return Image.network(urlImage);
  }*/

/*class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(Image)
        .getDownloadURL();
  }
}*/

/*  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image = Image.network(
        'https://i.blogs.es/1c1f22/samsung-galaxy-s21-06/1366_2000.jpg');
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return image;
  }*/

/*          FutureBuilder(
            future: storage.downloadURL(
                'Simulator Screen Shot - iPhone 13 - 2022-03-06 at 19.13.51.png'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Container(
                    width: 200,
                    height: 150,
                    child: Image.network(snapshot.data!));
              }
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return Container();
            },
          ),*/

/*          FutureBuilder(
            future: storage.listFiles(),
            builder: (BuildContext context,
                AsyncSnapshot<firebase_storage.ListResult> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          onPressed: () {},
                          child: Text(snapshot.data!.items[index].name),
                        );
                      }),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return Container();
            },
          ),*/

/*  buscaFoto() {
    FirebaseFirestore.instance
        .collection('BoxGimnasio')
        .doc(widget.usuario1.chosenValueBox)
        .collection('Usuario')
        .doc(widget.usuario1.correoPerfil)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      }
    });
  }*/

/*  @override
  void initState() {
    CollectionReference fotos = FirebaseFirestore.instance.collection('fotos');

    fotos.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print('YEAH ${result.data()}');
      });
    });

    super.initState();
  }*/


/*Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('fotos').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                children: snapshot.data!.docs.map((fotos){
                  return Center(
                    child: ListTile(
                      title: Text(fotos['nombre'], style: TextStyle(color: Colors.black),),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),*/



/*                    //PRESENTACION
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      child: Row(
                        children: [
                          Text(
                            'Presentación',
                            style: TextStyle(color: colorVerde, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: colorVerde),
                        color: Colors.white,
                      ),
                    ),
                    //PESOS MAXIMOS
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      child: Row(
                        children: [
                          Text(
                            'Pesos Máximos',
                            style: TextStyle(color: colorVerde, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
                      height: 100,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: colorVerde),
                                      color: colorVerde,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Clean & Jerk',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: colorVerde),
                                      color: colorVerde,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Snatch',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: colorVerde),
                                      color: colorVerde,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Clean',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: colorVerde),
                                      color: colorVerde,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'FrontSquat',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: colorVerde),
                                      color: colorVerde,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'BackSquat',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: colorVerde),
                                      color: colorVerde,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Deadlift',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),*/

/*GestureDetector(
                          onTap: () {
                            setState(() {
                              botonPress = 65;
                            });
                          },
                          child: Container(
                            width: 120,
                            height: 100,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.),
                              color: botonPress == 65 ? Colors. : Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${(k100lbs * 0.65).toInt().toString()}' +
                                      'kg|${(k100lbs * 0.65).toInt().toString() + 'lb'}',
                                  style: botonPress == 65
                                      ? botonPressStyle
                                      : botonNoPressStyle,
                                ),
                                const Text(
                                  ' 65%',
                                  style: porcentajeStyle,
                                ),
                              ],
                            ),
                          ),
                        ),*/

/*GestureDetector(
                onTap: () {
                  //CUANDO APRIETE CARGAR SUBE UNA PESTAÑA BLANCA CON BORDES REDONDOS Y MUESTRA LA BARRA CON EL PESO CARGADO Y LOS DISCOS
                  setState(() {
                    posicionBarra = 0;
                    if (widget.usuario1.chosenValueTD.toString() == '1') {
                      int kilosBarra =
                          (k100lbs * (botonPress / 100) * 0.453592).toInt() -
                              15;
                      colocarDiscos(kilosBarra, 'Kilos (kg)');
                    } else {
                      int kilosBarra = (k100lbs * (botonPress / 100)).toInt() -
                          (widget.usuario1.chosenValueTB == '45 lb' ? 45 : 35);
                      colocarDiscos(
                          kilosBarra, widget.usuario1.chosenValueTD.toString());
                    }
                  });
                },
                child: Container(
                  height: 112,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    color: colorVerde,
                  ),
                  child: Center(
                    child: Text(
                      'CARGA TU BARRA!',
                      style: botonCargarStyle,
                    ),
                  ),
                ),
              ),*/