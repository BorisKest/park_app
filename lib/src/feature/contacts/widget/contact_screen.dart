//import 'package:flutter/material.dart';
//import 'package:park_app/src/common/widget/large_bold_text.dart';
//import 'package:park_app/src/common/widget/large_text.dart';
//import 'package:park_app/src/common/widget/utils.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
//class ContactScreen extends StatelessWidget {
//  const ContactScreen({super.key});
//
//  static final Uri _urlAdress = Uri.parse('https://g.page/parquegrena?share');
//  static final Uri _urlFacebook =
//      Uri.parse('https://www.facebook.com/parquegrena/');
//  static final Uri _urlInstagram =
//      Uri.parse('https://www.instagram.com/parquegrena/');
//  static final Uri _urlWebSite = Uri.parse('https://parquegrena.pt/');
//
//  @override
//  Widget build(BuildContext context) => Scaffold(
//        appBar: AppBar(
//          backgroundColor: Theme.of(context).secondaryHeaderColor,
//          title: Text(AppLocalizations.of(context)!.contacts),
//        ),
//        body: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            Image.asset('assets/images/map.jpg'),
//            Container(
//              margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//              decoration: BoxDecoration(
//                color: Theme.of(context).primaryColor,
//                borderRadius: BorderRadius.circular(10),
//              ),
//              child: Column(
//                children: [
//                  Row(
//                    children: [
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                        child: const Icon(Icons.maps_home_work),
//                      ),
//                      LargeBoldText(
//                        text: AppLocalizations.of(context)!.adres,
//                      ),
//                    ],
//                  ),
//                  Container(
//                      alignment: Alignment.topLeft,
//                      margin: const EdgeInsets.fromLTRB(45, 5, 0, 10),
//                      child: GestureDetector(
//                        onTap: () => Utils.openLink(
//                          url: _urlAdress,
//                        ),
//                        child: const Text(
//                          'Lagoa das, 9675-045.',
//                          style: TextStyle(fontSize: 20),
//                          textAlign: TextAlign.start,
//                        ),
//                      )),
//                ],
//              ),
//            ),
//            RowBuilder(
//              icon: Icons.image,
//              text: 'Instagram',
//              urlLink: _urlInstagram,
//            ),
//            RowBuilder(
//              icon: Icons.facebook,
//              text: 'Faceboock',
//              urlLink: _urlFacebook,
//            ),
//            RowBuilder(
//              icon: Icons.web,
//              text: AppLocalizations.of(context)!.website,
//              urlLink: _urlWebSite,
//            ),
//          ],
//        ),
//      );
//}
//
//class RowBuilder extends StatelessWidget {
//  const RowBuilder({
//    required this.icon,
//    required this.text,
//    required this.urlLink,
//    super.key,
//  });
//
//  final IconData icon;
//  final String text;
//  final Uri urlLink;
//
//  @override
//  Widget build(BuildContext context) => Container(
//        height: 50,
//        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//        decoration: BoxDecoration(
//          color: Theme.of(context).primaryColor,
//          borderRadius: BorderRadius.circular(10),
//        ),
//        child: Row(
//          children: [
//            Container(
//              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//              child: Icon(icon),
//            ),
//            Builder(
//              builder: (context) => GestureDetector(
//                onTap: () => Utils.openLink(
//                  url: urlLink,
//                ),
//                child: LargeText(
//                  text: text,
//                ),
//              ),
//            ),
//          ],
//        ),
//      );
//}
//