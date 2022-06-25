import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final double size;
  final String text;
  const LargeText({
    Key? key,
    this.size = 28,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
