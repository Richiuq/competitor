class PostFB {
  String? nombrePerfil;
  String? nombreFotoPerfil;
  String? correoPerfil;
  String? nombreFoto;
  String? urlImage;
  String? cantNoRep;
  String? cantRep;
  String? lbkgVideo;
  String? pesoVideo;
  String? tipoVideo;
  String? nombreVideo;
  String? linkVideo;
  String? fechaPost;

  PostFB(n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13) {
    nombrePerfil = n1;
    nombreFotoPerfil = n2;
    correoPerfil = n3;
    nombreFoto = n4;
    urlImage = n5;
    cantNoRep = n6;
    cantRep = n7;
    lbkgVideo = n8;
    pesoVideo = n9;
    tipoVideo = n10;
    nombreVideo = n11;
    linkVideo = n12;
    fechaPost = n13;
  }
}


class UsuarioFB {
  String? nombrePerfil;
  String? nombreFotoPerfil;
  String? correoPerfil;
  String? contrasenaPerfil;
  String? boxPerfil;
  String? presentPerfil;
  String? pesoCleanJerk;
  String? pesoSnatch;
  String? pesoClean;
  String? pesoDeadlift;
  String? pesoBackSquat;
  String? pesoFrontSquat;
  String? chosenValueTD;
  String? chosenValueTB;

  UsuarioFB(n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14) {
    nombrePerfil = n1;
    nombreFotoPerfil = n2;
    correoPerfil = n3;
    contrasenaPerfil = n4;
    boxPerfil = n5;
    presentPerfil = n6;
    pesoCleanJerk = n7;
    pesoSnatch = n8;
    pesoClean = n9;
    pesoDeadlift = n10;
    pesoBackSquat = n11;
    pesoFrontSquat = n12;
    chosenValueTD = n13;
    chosenValueTB = n14;
  }
}

class Video {
  String? nombreVideo;
  String? linkVideo;
  String? cantRep;
  String? cantNoRep;
  String? tipoVideo;
  String? pesoVideo;
  String? lbkgVideo;

  Video(n1, n2, n3, n4, n5, n6, n7) {
    nombreVideo = n1;
    linkVideo = n2;
    cantRep = n3;
    cantNoRep = n4;
    tipoVideo = n5;
    pesoVideo = n6;
    lbkgVideo = n7;
  }
}


class Foto {
  String? nombreFoto;
  String? urlImage;

  Foto(n1, n2) {
    nombreFoto = n1;
    urlImage = n2;
  }
}

class Usuario {
  String? nombrePerfil;
  String? categoriaPerfil;
  String? chosenValueTD;
  String? chosenValueTB;
  String? pesoClean;
  String? pesoCleanJerk;
  String? pesoSnatch;
  String? pesoDeadlift;
  String? pesoBackSquat;
  String? pesoFrontSquat;
  String? contrasenaPerfil;
  String? correoPerfil;
  String? chosenValueBox;
  String? chosenValueTM;
  String? nombreFotoPerfil;
  String? nombrePost;
  String? tituloPost;
  List<Foto?>? fotosPerfil;

  Usuario(n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
      n17, n18) {
    nombrePerfil = n1;
    categoriaPerfil = n2;
    chosenValueTD = n3;
    chosenValueTB = n4;
    pesoClean = n5;
    pesoCleanJerk = n6;
    pesoSnatch = n7;
    pesoDeadlift = n8;
    pesoBackSquat = n9;
    pesoFrontSquat = n10;
    contrasenaPerfil = n11;
    correoPerfil = n12;
    chosenValueBox = n13;
    chosenValueTM = n14;
    nombreFotoPerfil = n15;
    nombrePost = n16;
    tituloPost = n17;
    fotosPerfil = n18;
  }
}


class BoxGimnasioFB {
  String? nombreBox;
  String? nombreFotoBox;
  String? ubicacionBox;

  BoxGimnasioFB(n1, n2, n3) {
    nombreBox = n1;
    nombreFotoBox = n2;
    ubicacionBox = n3;
  }
}

class BoxGimnasio {
  String? nombreBox;
  String? nombreFotoBox;
  String? ubicacionBox;
  String? foto1Box;
  String? foto2Box;
  String? foto3Box;
  String? foto4Box;
  String? foto5Box;
  String? foto6Box;
  List<Usuario?>? usuariosBox;

  BoxGimnasio(n1, n2, n3, n4, n5, n6, n7, n8, n9, n10) {
    nombreBox = n1;
    nombreFotoBox = n2;
    ubicacionBox = n3;
    foto1Box = n4;
    foto2Box = n5;
    foto3Box = n6;
    foto4Box = n7;
    foto5Box = n8;
    foto6Box = n9;
    usuariosBox = n10;
  }
}
