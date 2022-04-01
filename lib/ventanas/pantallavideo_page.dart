import 'package:competitor/constantes.dart';
import 'package:competitor/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PantallaVideoPage extends StatefulWidget {
  const PantallaVideoPage({Key? key, required this.videoPress})
      : super(key: key);

  final Video videoPress;

  @override
  State<PantallaVideoPage> createState() => _PantallaVideoPageState();
}

class _PantallaVideoPageState extends State<PantallaVideoPage> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      '${widget.videoPress.linkVideo}',
    );
    _controller!.initialize();
    _controller!.setLooping(false);
    _controller!.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: colorVerde,
      child: Container(
        height: 500,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          ),
        ),
      ),
    );
  }
}
