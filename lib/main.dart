import 'package:example_animation/explicit_animation.dart';
import 'package:example_animation/heart.dart';
import 'package:example_animation/water_wave.dart';
import 'package:flutter/material.dart';

import 'implicit_animation.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const WaterWave(),
    );
  }
}
