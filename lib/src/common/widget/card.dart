import 'package:flutter/material.dart';
import 'package:park_app/src/feature/map/wdiget/one_plant_screen.dart';

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

          flag = !flag;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceOut,
          color: Theme.of(context).primaryColor,
          height: 350,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 180,
                    width: 180,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(widget.titleText),
                  ),
                ],
              ),
              Expanded(
                child: Visibility(
                  visible: flag,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 5, 10, 10),
                    child: Text(widget.bodyText),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
