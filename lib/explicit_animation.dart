import 'package:flutter/material.dart';
import 'dart:math' as math;

const double dotSize = 20;
const int totalDot = 15;

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late ColorTween color = ColorTween(
    begin: Colors.yellow,
    end: Colors.red,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        final length = biggest.width / 2 - dotSize;

        double x(int index) {
          return length * math.cos((2 * math.pi / totalDot) * index);
        }

        double y(int index) {
          return length * math.sin((2 * math.pi / totalDot) * index);
        }

        Widget createDot(Size biggest, int index) {
          return PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                  Rect.fromLTWH(
                      biggest.width / 2, biggest.height / 2, dotSize, dotSize),
                  biggest),
              end: RelativeRect.fromSize(
                  Rect.fromLTWH(biggest.width / 2 + x(index),
                      biggest.height / 2 + y(index), dotSize, dotSize),
                  biggest),
            ).animate(_controller),
            child: AnimatedBuilder(
              builder: (context, _) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.evaluate(_controller),
                  ),
                  height: dotSize,
                );
              },
              animation: _controller,
            ),
          );
        }

        return RotationTransition(
          turns: _controller,
          child: Stack(
            children: [
              for (int i = 1; i <= totalDot; i++) createDot(biggest, i)
            ],
          ),
        );
      },
    );
  }
}
