import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Text(
        //   _count.toString(),
        //   style: const TextStyle(
        //     fontSize: 30,
        //   ),
        // ),
        //---------------AnimatedOpacity------------------
        // child: AnimatedOpacity(
        //   duration: const Duration(seconds: 2),
        //   opacity: _count % 3 == 0 ? 0 : 1,
        //   child: Text(
        //     _count.toString(),
        //     style: const TextStyle(
        //       fontSize: 30,
        //     ),
        //   ),
        // ),
        //---------------TweenAnimationBulder------------------
        child: TweenAnimationBuilder<double>(
          builder: (context, value, _) {
            return Opacity(
              opacity: value,
              child: Text(
                _count.toString(),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          },
          duration: const Duration(seconds: 2),
          tween: Tween(begin: 1, end: _count % 3 == 0 ? 0 : 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ++_count;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
