import 'package:flutter/material.dart';

class VideoBackgroudn extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  const VideoBackgroudn(
      {super.key,
      this.colors = const [Colors.transparent, Colors.black87],
      this.stops = const [0.0, 1.0]})
      : assert(colors.length == stops.length,
            'Stops and colors must be same length');

  @override
  Widget build(BuildContext context) {
    //* Positioned.fill que tome todo el espacio posible
    return Positioned.fill(
        //* Es un contenedor decorado DecoratedBox
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: colors,
        //* Donde queremos los colores se ponen en el stops
        stops: stops,
        //* Empezar el gradiente
        begin: Alignment.topCenter,
        //* Terminar el gradiente
        end: Alignment.bottomCenter,
      )),
    ));
  }
}
