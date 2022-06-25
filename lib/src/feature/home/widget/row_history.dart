import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';

class RowHistoryWidget extends StatelessWidget {
  RowHistoryWidget({
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
    return SizedBox(
      width: mediaQueryData.size.width,
      child: Column(
        children: [
          LargeText(text: dateText),
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
                  child: Image.asset(image),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                  child: Text(
                    mainText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
