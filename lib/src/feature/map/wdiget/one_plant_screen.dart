import 'package:flutter/material.dart';

class PlantScreenBuilder extends StatelessWidget {
  PlantScreenBuilder({
    Key? key,
    required this.image,
    required this.name,
    required this.descriptionText,
  }) : super(key: key);

  final String image;
  final String name;
  final String descriptionText;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image(
          image: NetworkImage(image),
        ),
        Text(name),
        Text(descriptionText),
      ],
    );
  }
}
