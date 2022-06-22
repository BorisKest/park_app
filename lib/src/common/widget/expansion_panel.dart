import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatefulWidget {
  BuildCard({
    required this.image,
    required this.titleText,
    required this.bodyText,
  });
  final String titleText, bodyText, image;
  @override
  State<BuildCard> createState() => _BuildCardState(
        bodyText: bodyText,
        image: image,
        titleText: titleText,
      );
}

class _BuildCardState extends State<BuildCard> {
  _BuildCardState({
    required this.image,
    required this.titleText,
    required this.bodyText,
  });
  final String titleText, bodyText, image;
  bool flag = false;
  double containerHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          flag = !flag;
          if (containerHeight > 200) {
            containerHeight = 200;
          } else {
            containerHeight = 450;
          }
          print(containerHeight);
          setState(() {});
        },
        child: Container(
          color: Theme.of(context).primaryColor,
          height: containerHeight,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    margin: EdgeInsets.all(10),
                    height: 180,
                    width: 180,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(titleText),
                ],
              ),
              Visibility(
                child: Text(bodyText),
                visible: flag,
              )
            ],
          ),
        ),
      ),
    );
  }
}
