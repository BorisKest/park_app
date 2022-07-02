import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/feature/plants/widget/one_plant_screen.dart';

import 'network_image.dart';

class BuildCard extends StatefulWidget {
  const BuildCard({
    required this.image,
    required this.titleText,
    required this.bodyText,
    super.key,
  });
  final String titleText;
  final String bodyText;
  final String image;

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  bool flag = false;
  double containerHeight = 200;

  void _openPlantScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantScreenBuilder(
          image: widget.image,
          name: widget.titleText,
          descriptionText: widget.bodyText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: GestureDetector(
        onTap: () {
          _openPlantScreen();
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceOut,
          color: Theme.of(context).primaryColor,
          height: 300,
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 250,
                  width: 230,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NetworkImageBuilder(image: widget.image)),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: LargeBoldText(text: widget.titleText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
