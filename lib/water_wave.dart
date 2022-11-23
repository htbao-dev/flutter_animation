import 'dart:async';

import 'package:flutter/material.dart';

class WaterWave extends StatefulWidget {
  const WaterWave({super.key});

  @override
  State<WaterWave> createState() => _WaterWaveState();
}

class _WaterWaveState extends State<WaterWave> with TickerProviderStateMixin {
  late final AnimationController ctrl1;
  late final AnimationController ctrl2;
  late final AnimationController ctrl3;
  late final AnimationController ctrl4;

  late final Animation animation1;
  late final Animation animation2;
  late final Animation animation3;
  late final Animation animation4;
  @override
  void initState() {
    ctrl1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    ctrl2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    ctrl3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    ctrl4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    animation1 = Tween<double>(begin: 1.9, end: 2.1)
        .animate(CurvedAnimation(parent: ctrl1, curve: Curves.easeInOut));
    animation2 = Tween<double>(begin: 1.8, end: 2.2)
        .animate(CurvedAnimation(parent: ctrl2, curve: Curves.easeInOut));
    animation3 = Tween<double>(begin: 1.8, end: 2.2)
        .animate(CurvedAnimation(parent: ctrl3, curve: Curves.easeInOut));
    animation4 = Tween<double>(begin: 1.9, end: 2.1)
        .animate(CurvedAnimation(parent: ctrl4, curve: Curves.easeInOut));

    Timer(const Duration(seconds: 2), () {
      ctrl1.repeat(reverse: true);
    });
    Timer(const Duration(milliseconds: 1400), () {
      ctrl2.repeat(reverse: true);
    });
    Timer(const Duration(milliseconds: 800), () {
      ctrl3.repeat(reverse: true);
    });
    ctrl4.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    ctrl1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          Listenable.merge([animation1, animation2, animation3, animation4]),
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: WaterWavePainter(
            animation1.value,
            animation2.value,
            animation3.value,
            animation4.value,
          ),
        );
      },
    );
  }
}

class WaterWavePainter extends CustomPainter {
  final double value1;
  final double value2;
  final double value3;
  final double value4;

  WaterWavePainter(this.value1, this.value2, this.value3, this.value4);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xff3B6ABA).withOpacity(.8)
      ..style = PaintingStyle.fill;

    var width = size.width;
    var height = size.height;

    var path = Path()
      ..moveTo(0, height / value1)
      ..cubicTo(
        width / 3,
        height / value2,
        2 * width / 3,
        height / value3,
        width,
        height / value4,
      )
      ..lineTo(width, height)
      ..lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
