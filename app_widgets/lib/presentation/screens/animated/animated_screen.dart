import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color starColor = Colors.teal;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120;
    height = random.nextInt(500) + 120;
    starColor = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    borderRadius = random.nextInt(100) + 20;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 400),
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: starColor,
            borderRadius: BorderRadius.circular(
              borderRadius <= 0 ? 0 : borderRadius,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
