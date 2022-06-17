import 'package:flutter/material.dart';

class ScrollViewWidget extends StatelessWidget {
  const ScrollViewWidget({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Image.asset(
                imageList[index % imageList.length],
              );
            },
            childCount: imageList.length * 2,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 0.0,
          ),
        ),
      ],
    );
  }
}
