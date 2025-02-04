import 'package:custom_painter_flutter/smily_custom_painter.dart';
import 'package:flutter/material.dart';

class Smily extends StatelessWidget {
  final Color faceColor;
  final Color eyeColor;
  final Color faceBorderColor;
  final Color eyeBallColor;
  final Color smileColor;
  final Size size;

  const Smily(
      {super.key,
      required this.size,
      this.faceColor = Colors.amber,
      this.eyeColor = Colors.white,
      this.faceBorderColor = Colors.black,
      this.eyeBallColor = Colors.black,
      this.smileColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SmilyCustomPainter(
          eyeBallColor: eyeBallColor, eyeColor: eyeColor, faceBorderColor: faceBorderColor, faceColor: faceColor, smileColor: smileColor),
      size: size,
    );
  }
}
