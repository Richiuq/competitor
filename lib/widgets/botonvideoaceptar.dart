import 'package:flutter/material.dart';
import 'dart:io';
import 'package:competitor/constantes.dart';
import 'package:video_player/video_player.dart';

class BotonVideoAceptar extends StatefulWidget {
  const BotonVideoAceptar({Key? key,required this.videoUpload}) : super(key: key);

  final String videoUpload;

  @override
  State<BotonVideoAceptar> createState() => _BotonVideoAceptarState();
}

class _BotonVideoAceptarState extends State<BotonVideoAceptar> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.videoUpload,
    );
    _controller!.initialize();
    _controller!.setLooping(true);
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
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white),
                  color: colorVerde,
                ),
                height: 30,
                width: 100,
                child: Text(
                  'Aceptar',
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
