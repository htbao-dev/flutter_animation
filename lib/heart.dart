import 'dart:math' as math;

import 'package:flutter/material.dart';

double heartFunction(double x) {
  return math.pow(x, 2).toDouble() + math.pow((x), 2);
}

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 1), lowerBound: 0.7);
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: controller,
      child: CustomPaint(
        painter: HeartPainter(),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    paint1
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.moveTo(0.5 * width, height * 0.35);

    path.cubicTo(
      width * 0.15,
      height * 0.2,
      0,
      height * 0.5,
      0.5 * width,
      height * 0.65,
    );
    path.moveTo(0.5 * width, height * 0.35);

    path.cubicTo(
      width * (1 - 0.15),
      height * 0.2,
      width,
      height * 0.5,
      width * 0.5,
      height * 0.65,
    );

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
