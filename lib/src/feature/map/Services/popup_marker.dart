import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/feature/map/Services/custom_page_route.dart';

class PopupMarker extends StatelessWidget {
  const PopupMarker({
    Key? key,
    required this.titleText,
    required this.image,
    required this.bodyText,
    required this.heroMark,
  }) : super(key: key);

  final String titleText;
  final List<String> image;
  final String bodyText;
  final String heroMark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            CustomPageRoute(
              builder: (context) {
                return _PopupMarkerCard(titleText: titleText, image: image, bodyText: bodyText, heroMark: heroMark);
              },
            ),
          );
        },
        child: Hero(
          tag: heroMark,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: Theme.of(context).secondaryHeaderColor,
            child: Center(
              child: Text(heroMark),
            ),
          ),
        ),
      ),
    );
  }
}

class _PopupMarkerCard extends StatelessWidget {
  _PopupMarkerCard({
    Key? key,
    required this.titleText,
    required this.image,
    required this.bodyText, // i dont like the way how var's is coming, need to finde other way ..
    required this.heroMark,
  }) : super(key: key);

  final String titleText;
  final List<String> image;
  final String bodyText;
  final String heroMark;

  final ScrollController imageScriollController = ScrollController();

  List<Widget> _imageList() {
    List<Widget> imagesToReturn = [];

    for (int i = 0; i < image.length; i++) {
      imagesToReturn.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Image(
              image: AssetImage(image[i]),
            ),
          ),
        ),
      );
    }
    return imagesToReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Hero(
          tag: heroMark,
          child: Material(
            color: Theme.of(context).secondaryHeaderColor,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    LargeBoldText(
                      text: titleText,
                      size: 20,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Scrollbar(
                      thumbVisibility: true,
                      controller: imageScriollController,
                      child: SingleChildScrollView(
                        controller: imageScriollController,
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(),
                        child: Row(
                          children: _imageList(),
                        ),
                      ),
                    ),
                    const Divider(),
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
