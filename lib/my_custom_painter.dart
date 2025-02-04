import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  var colors = [
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.brown,
    Colors.cyan
  ];

 

  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;
    Offset center = Offset(width / 2, height / 2);
     var rect = Rect.fromCircle(center: center, radius: 100);
    Paint paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(colors: colors, stops: [0,0.1, 0.2, 0.88,0.9]).createShader(rect);
    // ..strokeWidth = 20
    // ..strokeJoin = StrokeJoin.round
    // ..strokeCap = StrokeCap.butt;

    //canvas.drawCircle(center, 100, paint);
    canvas.drawRect(rect, paint);
    // canvas.drawLine(Offset.zero, Offset(100 , 0), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyCustomPainter oldDelegate) => false;
}
