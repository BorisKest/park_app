import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  //final Uri _urlAdress = Uri.parse('https://g.page/parquegrena?share');
  //final Uri _urlFacebook = Uri.parse('https://www.facebook.com/parquegrena/');
  //final Uri _urlInstagram = Uri.parse('https://www.instagram.com/parquegrena/');
  //final Uri _urlWebSite = Uri.parse('http://feliz-terra.com/');
  final Uri _url = Uri.parse('http://feliz-terra.com/');

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  Widget RowBulder(icon, String text) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Icon(icon),
          ),
          Container(
            child: InkWell(
              child: Text(
                text,
              ),
              onTap: _launchUrl,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('assets/images/map.jpg'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(Icons.maps_home_work),
                      ),
                      Container(
                        child: LargeBoldText(
                          text: 'Adres',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(45, 5, 0, 10),
                    child: InkWell(
                      child: Text(
                        'Lagoa das, 9675-045.',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                      onTap: _launchUrl,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: RowBulder(Icons.web, 'Site link here'),
            ),
            Container(
              child: RowBulder(Icons.facebook, 'Facebook link here'),
            ),
            Container(
              child: RowBulder(Icons.image, 'Instagram link here'),
            ),
          ],
        ),
      );
}
