import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/feature/map/Services/custom_page_route.dart';
import 'package:park_app/src/feature/map/Services/showLines.dart';
import 'package:park_app/src/feature/map/models/polylins.dart';

class RootPopUp extends StatelessWidget {
  RootPopUp({Key? key}) : super(key: key);

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
                        onTap: () => rootLines1 = ShowLines().showFirstRoot(),
                        child: RootCard(
                          image: 'assets/images/firstroot.jpg',
                          name: 'Root 1',
                          distance: '5 km.',
                          elevation: ' 300 m.',
                          calories: '400 kCl.',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => rootLines2 = ShowLines().showSecondRoot(),
                        child: RootCard(
                          image: 'assets/images/secondroot.jpg',
                          name: 'Root 1',
                          distance: '5 km.',
                          elevation: ' 300 m.',
                          calories: '400 kCl.',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => rootLines3 = ShowLines().showThirdRoot(),
                        child: RootCard(
                          image: 'assets/images/tirdroot.jpg',
                          name: 'Root 1',
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
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(Icons.route_outlined),
            ),
          ),
        ),
      ),
    );
  }
}

class RootCard extends StatelessWidget {
  String image;
  String name;
  String distance;
  String elevation;
  String calories;

  RootCard({
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
        child: Row(
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  LargeBoldText(text: '$name'),
                  Text(
                    '''
        distance: $distance
        elevation: $elevation
        calories: $calories
 ''',
                    style: TextStyle(),
                    textAlign: TextAlign.start,
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
