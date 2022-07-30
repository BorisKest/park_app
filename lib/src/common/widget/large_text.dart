import 'package:flutter/material.dart';

class LargeBoldText extends StatelessWidget {
  final double size;
  final String text;
  const LargeBoldText({
    Key? key,
    this.size = 28,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
