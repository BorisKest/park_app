import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:park_app/src/feature/map/Services/custom_page_route.dart';
import 'package:park_app/src/feature/map/models/polylins.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RootPopUp extends StatelessWidget {
  const RootPopUp({Key? key}) : super(key: key);

  List<LatLng> showRoot(List<LatLng> root, int index) {
    List<LatLng> result = lineNull;
    if (root == lineNull) {
      switch (index) {
        case 1:
          return result = lines;
        case 2:
          return result = lines2;
        case 3:
          return result = lines3;
      }
    } else {
      result = lineNull;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: (() {
          Navigator.of(context).push(
            CustomPageRoute(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          rootLines1 = showRoot(rootLines1, 1);
                          Navigator.of(context).pop();
                        },
                        child: RootCard(
                          image: 'assets/images/firstroot.jpg',
                          name: AppLocalizations.of(context)!.rootName1,
                          distance: '5 km.',
                          elevation: ' 300 m.',
                          calories: '400 kCl.',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          rootLines2 = showRoot(rootLines2, 2);
                          Navigator.of(context).pop();
                        },
                        child: RootCard(
                          image: 'assets/images/secondroot.jpg',
                          name: AppLocalizations.of(context)!.rootName2,
                          distance: '5 km.',
                          elevation: ' 300 m.',
                          calories: '400 kCl.',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          rootLines3 = showRoot(rootLines3, 3);
                          Navigator.of(context).pop();
                        },
                        child: RootCard(
                          image: 'assets/images/tirdroot.jpg',
                          name: AppLocalizations.of(context)!.rootName3,
                          distance: '5 km.',
                          elevation: ' 300 m.',
                          calories: '400 kCl.',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
        child: Hero(
          tag: 1,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: Theme.of(context).secondaryHeaderColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, right: 10.0, bottom: 5.0),
              child: Column(
                children: [
                  const Icon(Icons.route_outlined),
                  Text(AppLocalizations.of(context)!.roots, style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RootCard extends StatelessWidget {
  final String image;
  final String name;
  final String distance;
  final String elevation;
  final String calories;

  const RootCard({
    Key? key,
    required this.image,
    required this.name,
    required this.distance,
    required this.elevation,
    required this.calories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Material(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(image),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    '\n${AppLocalizations.of(context)!.rootDistance} $distance \n${AppLocalizations.of(context)!.rootElevation}$elevation \n${AppLocalizations.of(context)!.calories} $calories',
                    style: const TextStyle(),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: Text(AppLocalizations.of(context)!.tapToShow),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
