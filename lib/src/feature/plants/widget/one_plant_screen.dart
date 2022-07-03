import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/network_image.dart';

class PlantScreenBuilder extends StatelessWidget {
  const PlantScreenBuilder({
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(name),
      ),
      body: ListView(
        children: <Widget>[
          NetworkImageBuilder(image: image),
          Container(margin: const EdgeInsets.all(25), child: Text(descriptionText)),
        ],
      ),
    );
  }
}
