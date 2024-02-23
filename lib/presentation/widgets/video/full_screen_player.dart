import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  //* Inicializar
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      //* En vez de hacer de esta forma controller.play() / ..setVolume(0)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  //* Quitar el video para que no se siga reproduciendo cuando no lo estemos viendo
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          //* snapshot es el estado de es Future
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
            );
          }
          //* Detector de gestos, Lo utlizaremos para pausar el video
          return GestureDetector(
            onTap: () {
              //* Validamos si lo esta reproduciendo y lo pausamos
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }
              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              //* Stack nos sirve para poner widgets uno sobre o otros
              child: Stack(children: [
                VideoPlayer(controller),
                //* Gradiente
                VideoBackgroudn(
                  // 0.8 que empiece en 80% de la pantalla y que termien en el 1.0 en la totalidad del mismo
                  stops: const [0.8, 1.0],
                ),
                //* Texto
                //* Positioned por widget en cualquier posicion
                Positioned(
                    left: 20,
                    bottom: 50,
                    child: _VideoCaption(caption: widget.caption))
              ]),
            ),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    //* Sacamos el tamaño del dispositivo
    final size = MediaQuery.of(context).size;
    //* leemos el estilo global
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: textStyle,
      ),
    );
  }
}
