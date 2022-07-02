import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: max(300, 500),
                        margin: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
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
                      //History section
                      Container(
                        width: max(300, 500),
                        margin: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
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

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        child: Row(
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
                      //end of history section
                      //
                      //   const LargeBoldText(text: 'Gallery'),
                      //   const GalleryBuilder(
                      //       url1:
                      //           'https://instagram.flis6-1.fna.fbcdn.net/v/t51.2885-15/288871533_330126222668975_2835068592426741042_n.jpg?stp=dst-webp_e35_p1080x1080&cb=9ad74b5e-be52112b&_nc_ht=instagram.flis6-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=w-ui9r6ziv4AX_OKYwj&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=Mjg2Mjc0MTg2ODM1OTM1MTkyMQ%3D%3D.2-ccb7-5&oh=00_AT-dBBhtxA5vOFlhi4nYX_dkv3zLy2-CyhG8GemJoXL0EQ&oe=62B55B00&_nc_sid=30a2ef',
                      //       url2:
                      //           'https://instagram.flis6-1.fna.fbcdn.net/v/t51.2885-15/285309829_462289562369944_8245485446892871040_n.jpg?stp=dst-webp_e35&cb=9ad74b5e-be52112b&_nc_ht=instagram.flis6-1.fna.fbcdn.net&_nc_cat=104&_nc_ohc=xBj-VmTRxB4AX98w-5R&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=Mjg1MDUwNDMxNjQ3NDcwMjQwMw%3D%3D.2-ccb7-5&oh=00_AT8kG8Pk1u1og5Ixqkt0I73RiO0Lg0zbRF8GjUrED5E-nA&oe=62B468EA&_nc_sid=30a2ef'),
                      //   const GalleryBuilder(
                      //       url1:
                      //           'https://instagram.flis6-1.fna.fbcdn.net/v/t51.2885-15/280192000_3132950910355202_3744578009423768158_n.jpg?stp=dst-webp_e35_p750x750_sh0.08&cb=9ad74b5e-be52112b&_nc_ht=instagram.flis6-1.fna.fbcdn.net&_nc_cat=102&_nc_ohc=9oeFFLqOVsgAX-5BfBs&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MjgzNDUwNDMwNDc3MDk0ODUwNA%3D%3D.2-ccb7-5&oh=00_AT9D89E2Q4ITtdyjMHG0XAPWEvpXSx1aoX5EJTKQE2_TjA&oe=62B4CD52&_nc_sid=30a2ef',
                      //       url2:
                      //           'https://instagram.flis6-1.fna.fbcdn.net/v/t51.2885-15/279441932_367811995404478_8330611425952218230_n.jpg?stp=dst-webp_e35&cb=9ad74b5e-be52112b&_nc_ht=instagram.flis6-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=OLQ63Fe-890AX8l_lQu&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MjgyNzk4NTU5MTAyMDQyNTIwNw%3D%3D.2-ccb7-5&oh=00_AT_4h1AYI0jvOfgH4IYgJDOQkhdoNqrp13NOzyCTvrhGrQ&oe=62B51637&_nc_sid=30a2ef'),
                      //   const GalleryBuilder(
                      //       url1:
                      //           'https://instagram.flis6-1.fna.fbcdn.net/v/t51.2885-15/278898576_718617589290661_8965175675426540560_n.jpg?stp=dst-webp_e35_s1080x1080&cb=9ad74b5e-be52112b&_nc_ht=instagram.flis6-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=-_qvvepWb28AX_xP0nI&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MjgyMDcwMTI5NzE5MzQ2MjIyNg%3D%3D.2-ccb7-5&oh=00_AT_eSd4jj_U7yyoh3xCMzoZ3he4_ih6yqwPzL3cyHgvY6A&oe=62B51CB3&_nc_sid=30a2ef',
                      //       url2:
                      //           'https://instagram.flis6-1.fna.fbcdn.net/v/t51.2885-15/278181610_755268099212923_3880738031577876861_n.jpg?stp=dst-webp_e35_p1080x1080&cb=9ad74b5e-be52112b&_nc_ht=instagram.flis6-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=J_psPjYZX8wAX-q9FIr&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MjgxNDE5MzgxMDc4OTM1ODU5OQ%3D%3D.2-ccb7-5&oh=00_AT-jIvrPtc_JIgtw41ffY9BQJV4933PbqnvOVynJCeYFJQ&oe=62B48D7F&_nc_sid=30a2ef'),
                      Container(
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5), color: Theme.of(context).primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => Utils.openLink(url: _urlAdress),
                              icon: const Icon(Icons.location_on),
                              color: Theme.of(context).iconTheme.color,
                              iconSize: 40,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Utils.openLink(url: _urlFacebook),
                              icon: const Icon(Icons.facebook),
                              color: Theme.of(context).iconTheme.color,
                              iconSize: 40,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Utils.openLink(url: _urlInstagram),
                              icon: const Icon(Icons.image),
                              color: Theme.of(context).iconTheme.color,
                              iconSize: 40,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Utils.openLink(url: _urlWebSite),
                              icon: const Icon(Icons.web),
                              color: Theme.of(context).iconTheme.color,
                              iconSize: 40,
                            ),
                          ],
                        ),
                      )
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
