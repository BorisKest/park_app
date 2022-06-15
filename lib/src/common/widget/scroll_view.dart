import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';

class ScrollViewWidget extends StatelessWidget {
  ScrollViewWidget({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                child: Image.asset(
                  imageList[index % imageList.length],
                ),
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
