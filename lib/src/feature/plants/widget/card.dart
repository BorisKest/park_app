import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/common/widget/network_image.dart';
import 'package:park_app/src/feature/plants/widget/one_plant_screen.dart';

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
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: () {
          _openPlantScreen();
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.linear,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 170,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: NetworkImageBuilder(image: widget.image),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: LargeBoldText(
                  text: widget.titleText,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
