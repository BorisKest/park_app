import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/feature/map/wdiget/custom_page_route.dart';

class PopupMarker extends StatelessWidget {
  const PopupMarker({
    Key? key,
    required this.titleText,
    required this.image,
    required this.bodyText,
  }) : super(key: key);

  final String titleText;
  final String image;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CustomPageRoute(
            builder: (context) {
              return _PopupMarkerCard(
                titleText: titleText,
                image: image,
                bodyText: bodyText,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: _heroMark,
        child: Material(
          color: Theme.of(context).secondaryHeaderColor,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: const Icon(
            Icons.location_pin,
          ),
        ),
      ),
    );
  }
}

const String _heroMark = 'show_marker_info';

class _PopupMarkerCard extends StatelessWidget {
  const _PopupMarkerCard({
    Key? key,
    required this.titleText,
    required this.image,
    required this.bodyText, // i dont like the way how var's is coming, need to finde other way ..
  }) : super(key: key);

  final String titleText;
  final String image;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroMark,
          child: Material(
            color: Theme.of(context).secondaryHeaderColor,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    LargeBoldText(text: titleText),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Image(image: AssetImage(image)),
                    Text(bodyText),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
