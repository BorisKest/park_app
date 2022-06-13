import 'dart:io';

import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  final String _urlAdress = 'https://g.page/parquegrena?share';
  final Uri _urlFacebook = Uri.parse('https://www.facebook.com/parquegrena/');
  final Uri _urlInstagram = Uri.parse('https://www.instagram.com/parquegrena/');
  final Uri _urlWebSite = Uri.parse('http://feliz-terra.com/');

  Widget RowBuilder(IconData icon, String text, String urlLink) {
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
            child: Link(
              uri: Uri.parse('$urlLink'),
              builder: (context, followLink) => GestureDetector(
                onTap: followLink,
                child: Text(
                  text,
                ),
              ),
            ),
          ),
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
                    child: Text(
                      'Lagoa das, 9675-045.',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: RowBuilder(Icons.facebook, 'WebSite link here',
                  'http://feliz-terra.com/'),
            ),
            Container(
              child: RowBuilder(Icons.facebook, 'Facebook link here',
                  'http://feliz-terra.com/'),
            ),
            Container(
              child: RowBuilder(Icons.image, 'Instagram link here',
                  'https://www.instagram.com/parquegrena/'),
            ),
          ],
        ),
      );
}
