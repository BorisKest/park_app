import 'dart:math';

import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/common/widget/scroll_view.dart';
import 'package:park_app/src/common/widget/row_history.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  int index = 0;

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
                            child: LargeBoldText(text: 'About park'),
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
                            child: LargeBoldText(text: 'Park History'),
                          ),
                        ),

                        RowHistoryWidget(
                          dateText: '1832 – 1882',
                          image: imageList[5],
                          mainText:
                              """In 1832 an English man acquires a beautiful land surrounding Furnas lake. In 1858, it's next owner - Vines, an English Consul in Ponta Delgada - builds a summer house at the property and calls it Grená in tribute to his wife's who spent her childhood summers in Ireland at a family house with that name. After his dead in 1874, the property goes to a London surgeon, name Hinton, who also passes away one year later. In 1875 James Brown explores the house has a hotel for a few years. After his dead, in 1882, D. Catarina sells the property to Jorge Hayes who rents it to the Portuguese José do Canto a few years later.""",
                        ),
                        RowHistoryWidget(
                          dateText: '1987',
                          image: imageList[0],
                          mainText:
                              """In June of 1987 the Portuguese Governors, President Mario Soares and Primer Minister Cavaco Silva, are advised to buy the property from the last heirs - family Mendonça Dias - to accommodate the Government members when visiting the Azores.""",
                        ),
                        RowHistoryWidget(
                          dateText: '2009',
                          image: imageList[1],
                          mainText:
                              """ Mota Amaral and Joaquim Ponte, representatives of the Azorean Region in the Portuguese Government, presented several claims to the abandon of Grená - a Portuguese patrimony - left to ruins by the Government over the last 22 years.""",
                        ),
                        RowHistoryWidget(
                          dateText: '2015',
                          image: imageList[2],
                          mainText:
                              """Several years after many internal bureaucracy, the Portuguese Government gives Grená's ownership to the Azorean Autonomous Region.""",
                        ),
                        RowHistoryWidget(
                          dateText: '2018',
                          image: imageList[3],
                          mainText:
                              """The Azorean Government decides to sell Grená's property, which was left abandoned in a high state of degradation. Feliz Terra buys it and initiates their hard work to clean and dignify the property again as a nature gift.""",
                        ),
                        RowHistoryWidget(
                          dateText: '2019',
                          image: imageList[4],
                          mainText:
                              """More than one year later with a tremendous effort from a dedicated team to recover Grená's beauty, the park open to the general public, giving back preserved nature to people.""",
                        ),
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
