import 'package:flutter/material.dart';

class GalleryBuilder extends StatelessWidget {
  const GalleryBuilder({
    Key? key,
    required this.url1,
    required this.url2,
  }) : super(key: key);

  final String url1;
  final String url2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 5,
                ),
                child: Image.network(url1),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                child: Image.network(url2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
