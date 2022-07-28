import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:park_app/src/common/widget/large_text.dart';

class Product extends StatelessWidget {
  final String name;
  final String image;
  final String bodyText;
  final String price;

  const Product({
    Key? key,
    required this.name,
    required this.image,
    required this.bodyText,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: Row(
            children: [
              LargeBoldText(text: name),
              const Spacer(),
              LargeText(text: price),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(image),
                      const Divider(),
                      Text(bodyText),
                    ],
                  ),
                ))
          ],
        ));
  }
}
