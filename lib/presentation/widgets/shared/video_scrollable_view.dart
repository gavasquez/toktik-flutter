import 'package:flutter/material.dart';
import 'package:toktik/domian/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    //TODO: PageView nos permite hacer un scroll a pantalla completa
    //* PageView toma todo el espacio de la pantalla
    //* builder Construlle  los widgets que se van a mostrar en cada pagina
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      //* Orientación del Scroll scrollDirection
      scrollDirection: Axis.vertical,
      //* Cantidad de los videos
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        //* Cada video es una carda con su propia imagen y titulo
        final videoPost = videos[index];
        //* Permite poner los widgets uno sobre otros
        return Stack(
          children: [
            //Video Player + Gradiente
            SizedBox.expand(
                child: FullScreenPlayer(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl,
            )),
            // Botones
            //* Positioned nos permite poner los hijos en cualquier posicion
            Positioned(
                bottom: 40, right: 20, child: VideoBotons(video: videoPost)),
          ],
        );
      },
    );
  }
}
