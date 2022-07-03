import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';

class RowHistoryWidget extends StatelessWidget {
  const RowHistoryWidget({
    Key? key,
    required this.dateText,
    required this.image,
    required this.mainText,
  }) : super(key: key);

  final String dateText;
  final String image;
  final String mainText;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor,
      ),
      width: mediaQueryData.size.width - 30,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          LargeText(text: dateText),
          Container(
            height: 300,
            margin: const EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
            ),
            child: Image.asset(image),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              mainText,
            ),
          ),
        ],
      ),
    );
  }
}
