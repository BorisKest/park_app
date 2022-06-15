import 'package:flutter/material.dart';

class LargeBoldText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  LargeBoldText({
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
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
