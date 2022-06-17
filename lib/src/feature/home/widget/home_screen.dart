import 'dart:math';

import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/common/widget/row_history.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final int index = 0;

  final List<String> imageList = [
    "assets/images/imageHistory1.jpg",
    "assets/images/imageHistory2.jpg",
    "assets/images/imageHistory3.jpg",
    "assets/images/imageHistory4.jpg",
    "assets/images/imageHistory5.jpg",
    "assets/images/imageHistory6.jpg",
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: null,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/backgroundMain.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.15),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 330,
                      ),
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
                          ],
                        ),
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
                      ],
                    ),
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
                  const SizedBox(
                    height: 300,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: max(300, 500),
                          margin: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 54, 75, 102),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            child: LargeBoldText(
                                text: AppLocalizations.of(context)!.aboutPark),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 20, 20),
                          child: Text(
                              AppLocalizations.of(context)!.descriptionText),
                        ),
                        //History section
                        Container(
                          width: max(300, 500),
                          margin: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 54, 75, 102),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            child: LargeBoldText(
                                text:
                                    AppLocalizations.of(context)!.parkHistory),
                          ),
                        ),

                        RowHistoryWidget(
                            dateText: '1832 – 1882',
                            image: imageList[5],
                            mainText:
                                AppLocalizations.of(context)!.historyPart0),
                        RowHistoryWidget(
                            dateText: '1987',
                            image: imageList[0],
                            mainText:
                                AppLocalizations.of(context)!.historyPart1),
                        RowHistoryWidget(
                            dateText: '2009',
                            image: imageList[1],
                            mainText:
                                AppLocalizations.of(context)!.historyPart2),
                        RowHistoryWidget(
                            dateText: '2015',
                            image: imageList[2],
                            mainText:
                                AppLocalizations.of(context)!.historyPart3),
                        RowHistoryWidget(
                            dateText: '2018',
                            image: imageList[3],
                            mainText:
                                AppLocalizations.of(context)!.historyPart4),
                        RowHistoryWidget(
                            dateText: '2019',
                            image: imageList[4],
                            mainText:
                                AppLocalizations.of(context)!.historyPart5),
                        //end of history section
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
