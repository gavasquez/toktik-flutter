import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domian/entities/video_post.dart';

class VideoBotons extends StatelessWidget {
  final VideoPost video;
  const VideoBotons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          iconColor: Colors.red,
          iconData: Icons.favorite,
          value: video.likes,
        ),
        const SizedBox(
          height: 10,
        ),
        _CustomIconButton(
          iconData: Icons.remove_red_eye_outlined,
          value: video.likes,
        ),
        const SizedBox(
          height: 10,
        ),
        //* Animacion de la libreria de fernando
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            iconData: Icons.play_circle_outline,
            value: 0,
          ),
        )
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;

  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        if (value > 0) Text(HumanFormast.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
