import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'MAP ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'TrajanPro',
                      fontSize: 24,
                      color: Color.fromARGB(255, 19, 17, 17),
                    ),
                  ),
                ])
          ],
        ),
      ));
}
