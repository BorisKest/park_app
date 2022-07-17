import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/common/localization/l10n.dart';
import 'package:park_app/src/common/widget/gallery_widget.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/feature/home/widget/row_history.dart';

import '../../../common/widget/utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final int index = 0;

  static final Uri _urlAdress = Uri.parse('https://g.page/parquegrena?share');
  static final Uri _urlFacebook = Uri.parse('https://www.facebook.com/parquegrena/');
  static final Uri _urlInstagram = Uri.parse('https://www.instagram.com/parquegrena/');
  static final Uri _urlWebSite = Uri.parse('https://parquegrena.pt/');

  final List<String> imageList = [
    "assets/images/imageHistory1.jpg",
    "assets/images/imageHistory2.jpg",
    "assets/images/imageHistory3.jpg",
    "assets/images/imageHistory4.jpg",
    "assets/images/imageHistory5.jpg",
    "assets/images/imageHistory6.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ScrollController firstController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: mediaQueryData.size.height,
            snap: false,
            floating: false,
            backgroundColor: Theme.of(context).backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              titlePadding: EdgeInsets.only(bottom: mediaQueryData.size.height / 2.5),
              title: RichText(
                textWidthBasis: TextWidthBasis.longestLine,
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'WATERFALLS PARK ' '\n',
                      style: TextStyle(
                        fontFamily: 'TrajanPro',
                        fontSize: 15,
                        color: Colors.white,
                        shadows: <Shadow>[Shadow(offset: Offset(0, 2.0), blurRadius: 2.0, color: Colors.black)],
                      ),
                    ),
                    TextSpan(
                      text: 'Grená' '\n',
                      style: TextStyle(
                        fontFamily: 'TrajanPro',
                        fontSize: 70,
                        color: Colors.white,
                        shadows: <Shadow>[Shadow(offset: Offset(0, 2.0), blurRadius: 2.0, color: Colors.black)],
                      ),
                    ),
                    TextSpan(
                      text: '1832',
                      style: TextStyle(
                          fontFamily: 'TrajanPro',
                          fontSize: 20,
                          color: Colors.white,
                          shadows: <Shadow>[Shadow(offset: Offset(0, 2.0), blurRadius: 2.0, color: Colors.black)]),
                    ),
                  ],
                ),
              ),
              background: Container(
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
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: max(300, 500),
                        margin: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).secondaryHeaderColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          child: LargeBoldText(text: AppLocalizations.of(context)!.aboutPark),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(left: 10, right: 20),
                        child: Image.asset(
                          'assets/images/map.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 20, 20),
                        child: Text(AppLocalizations.of(context)!.descriptionText),
                      ),

                      const Divider(),

                      //History section
                      Container(
                        width: max(300, 500),
                        margin: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).secondaryHeaderColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          child: LargeBoldText(text: AppLocalizations.of(context)!.parkHistory),
                        ),
                      ),

                      Scrollbar(
                        thumbVisibility: true,
                        controller: firstController,
                        child: SingleChildScrollView(
                          controller: firstController,
                          scrollDirection: Axis.horizontal,
                          physics: const PageScrollPhysics(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowHistoryWidget(
                                  dateText: '1832 – 1882',
                                  image: imageList[5],
                                  mainText: AppLocalizations.of(context)!.historyPart0),
                              RowHistoryWidget(
                                  dateText: '1987',
                                  image: imageList[0],
                                  mainText: AppLocalizations.of(context)!.historyPart1),
                              RowHistoryWidget(
                                  dateText: '2009',
                                  image: imageList[1],
                                  mainText: AppLocalizations.of(context)!.historyPart2),
                              RowHistoryWidget(
                                  dateText: '2015',
                                  image: imageList[2],
                                  mainText: AppLocalizations.of(context)!.historyPart3),
                              RowHistoryWidget(
                                  dateText: '2018',
                                  image: imageList[3],
                                  mainText: AppLocalizations.of(context)!.historyPart4),
                              RowHistoryWidget(
                                  dateText: '2019',
                                  image: imageList[4],
                                  mainText: AppLocalizations.of(context)!.historyPart5),
                            ],
                          ),
                        ),
                      ),
                      //end of history section
                      const Divider(),

                      Column(
                        children: [
                          LargeBoldText(text: AppLocalizations.of(context)!.contacts),
                          Container(
                            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5), color: Theme.of(context).secondaryHeaderColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: ('Google maps'),
                                  onPressed: () => Utils.openLink(url: _urlAdress),
                                  icon: const Icon(Icons.location_on),
                                  color: Theme.of(context).iconTheme.color,
                                  iconSize: 30,
                                ),
                                const Spacer(),
                                IconButton(
                                  tooltip: ('Facebook'),
                                  onPressed: () => Utils.openLink(url: _urlFacebook),
                                  icon: const Icon(Icons.facebook),
                                  color: Theme.of(context).iconTheme.color,
                                  iconSize: 30,
                                ),
                                const Spacer(),
                                IconButton(
                                  tooltip: ('Instagram'),
                                  onPressed: () => Utils.openLink(url: _urlInstagram),
                                  icon: const Icon(Icons.image),
                                  color: Theme.of(context).iconTheme.color,
                                  iconSize: 30,
                                ),
                                const Spacer(),
                                IconButton(
                                  tooltip: ('Web site'),
                                  onPressed: () => Utils.openLink(url: _urlWebSite),
                                  icon: const Icon(Icons.web),
                                  color: Theme.of(context).iconTheme.color,
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
