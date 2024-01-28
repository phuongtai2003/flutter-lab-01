import 'package:flutter/material.dart';

class Exercise01 extends StatelessWidget {
  const Exercise01({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
        child: const Text(
          'Hello World',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 5,
            color: Colors.red,
          ),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
