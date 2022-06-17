import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const LargeText({
    Key? key,
    this.size = 33,
    required this.text,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
