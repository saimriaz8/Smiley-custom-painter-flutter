import 'dart:async';
import 'dart:math' as math;
import 'package:custom_painter_flutter/my_custom_painter.dart';
import 'package:custom_painter_flutter/smily.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const maxExtent = 400.0;
  static const minExtent = 50.0;

  double extent = maxExtent;
  double stepExtent = 10.0;
  double t = 0.0;
  Color faceColor = Colors.amber;

  @override
  void initState() {
    // Timer.periodic(const Duration(milliseconds: 100), timerCallbackFunction);

    super.initState();
  }

  void timerCallbackFunction(Timer timer) {
    setState(() {
      if (t < 0.8) {
        t += 0.03;
      } else {
        t = 0.0;
      }
      faceColor = Color.lerp(Colors.amber, Colors.red, t)!;
      //  faceColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      //      .withOpacity(1.0);
      if (extent < maxExtent) {
        extent += stepExtent;
      } else {
        extent = minExtent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Smily(
                size: Size(
                  extent,
                  extent,
                ),
                faceColor: faceColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
