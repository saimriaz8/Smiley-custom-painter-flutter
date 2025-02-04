import 'dart:math';

import 'package:flutter/material.dart';

class SmilyCustomPainter extends CustomPainter {
  final Color faceColor;
  final Color eyeColor;
  final Color faceBorderColor;
  final Color eyeBallColor;
  final Color smileColor;

  SmilyCustomPainter(
      {this.faceColor = Colors.amber,
      this.eyeColor = Colors.white,
      this.faceBorderColor = Colors.black,
      this.eyeBallColor = Colors.black,
      this.smileColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;
    final radius = min(width, height) / 2;
    final eyeRadius = radius * 0.2;
    final innerEyeRadius = radius * 0.05;
    final mouthRadius = radius * 0.4;
    final mouthDistanceFromCenter = radius * 0.2;
    final eyeHorizontalDeviation = radius * 0.5;
    final eyeVerticalDeviation = radius * 0.4;
    final eyeVerticalPosition = height / 2 - eyeVerticalDeviation;
    final leftEyeHorizontalPosition = width / 2 - eyeHorizontalDeviation;
    final rightEyeHorizontalPostion = width / 2 + eyeHorizontalDeviation;
    final innerEyeHorizontalDeviation = radius * 0.5;
    final innerEyeVerticalDeviation = radius * 0.4;
    final innerEyeVerticalPosition = height / 2 - innerEyeVerticalDeviation;
    final leftInnerEyeHorizontalPosition =
        width / 2 - innerEyeHorizontalDeviation;
    final rightInnerEyeHorizontalPosition =
        width / 2 + innerEyeHorizontalDeviation;

    // Offsets
    final centerOffset = Offset(width / 2, height / 2);
    final leftEyeOffset =
        Offset(leftEyeHorizontalPosition, eyeVerticalPosition);
    final rightEyeOffset =
        Offset(rightEyeHorizontalPostion, eyeVerticalPosition);
    final innerLeftEyeOffset =
        Offset(leftInnerEyeHorizontalPosition, innerEyeVerticalPosition);
    final innerRightEyeOffset =
        Offset(rightInnerEyeHorizontalPosition, innerEyeVerticalPosition);

    final mouthOffset =
        Offset(centerOffset.dx, centerOffset.dy + mouthDistanceFromCenter);

    //Paints
    final facePaint = Paint()..color = faceColor;
    final eyePaint = Paint()..color = eyeColor;
    final faceBorderPaint = Paint()
      ..color = faceBorderColor
      ..style = PaintingStyle.stroke;
    final innerEyeBallPaint = Paint()..color = eyeBallColor;
    final smilePaint = Paint()
      ..color = smileColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.05;

    // Draw face
    canvas.drawCircle(centerOffset, radius, facePaint);

    // Draw face border
    canvas.drawCircle(centerOffset, radius, faceBorderPaint);

    // Draw left eye
    canvas.drawCircle(leftEyeOffset, eyeRadius, eyePaint);

    // Draw right eye
    canvas.drawCircle(rightEyeOffset, eyeRadius, eyePaint);

    // Draw inner left eye
    canvas.drawCircle(innerLeftEyeOffset, innerEyeRadius, innerEyeBallPaint);

    // Draw inner right eye
    canvas.drawCircle(innerRightEyeOffset, innerEyeRadius, innerEyeBallPaint);

    // Draw mouth
    canvas.drawArc(Rect.fromCircle(center: mouthOffset, radius: mouthRadius),
        degreeToRadiant(30), degreeToRadiant(120), false, smilePaint);

    
  }

  @override
  bool shouldRepaint(SmilyCustomPainter oldDelegate) => isRepaint(oldDelegate);

  @override
  bool shouldRebuildSemantics(SmilyCustomPainter oldDelegate) => isRepaint(oldDelegate);

  bool isRepaint(SmilyCustomPainter oldDelegate) {
    return oldDelegate.faceColor != faceColor ||
        oldDelegate.eyeColor != eyeColor ||
        oldDelegate.faceBorderColor != faceBorderColor ||
        oldDelegate.eyeBallColor != eyeBallColor ||
        oldDelegate.smileColor != smileColor;
  }

  double degreeToRadiant(double degree) => degree * pi / 180;
}
