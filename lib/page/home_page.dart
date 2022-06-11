import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backgroundMain.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'WATERFALLS PARK ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'TrajanPro',
                            fontSize: 24,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(0, 2.0),
                                  blurRadius: 2.0,
                                  color: Colors.black)
                            ]),
                      ),
                    ],
                  ),
                  const Text(
                    'Grená',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'TrajanPro',
                        fontSize: 90,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                              offset: Offset(0, 2.0),
                              blurRadius: 2.0,
                              color: Colors.black)
                        ]),
                  ),
                  const Text(
                    '1832',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'TrajanPro',
                        fontSize: 29,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                              offset: Offset(0, 2.0),
                              blurRadius: 2.0,
                              color: Colors.black)
                        ]),
                  ),
                ],
              ),
            )),
      );
}
