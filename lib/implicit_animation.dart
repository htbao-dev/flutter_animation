import 'dart:math' as math;

import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool isBig = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: AnimatedContainer(
        //   duration: const Duration(
        //     milliseconds: 500,
        //   ),
        //   width: isBig ? 300 : 100,
        //   // curve: Curves.bounceIn,
        //   child: Image.network(
        //       'https://upload.wikimedia.org/wikipedia/commons/9/9d/Tomato.png'),
        // ),

        //---------------TweenAnimationBulder------------------
        child: TweenAnimationBuilder<double>(
          builder: (context, value, _) {
            return Transform.rotate(
              angle: value,
              child: SizedBox(
                width: 300,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/9/9d/Tomato.png',
                ),
              ),
            );
          },
          duration: const Duration(seconds: 2),
          tween: Tween(begin: 0, end: 2 * math.pi),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isBig = !isBig;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
