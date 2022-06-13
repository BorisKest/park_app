import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:url_launcher/link.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const String _urlAdress = 'https://g.page/parquegrena?share';
  static final Uri _urlFacebook =
      Uri.parse('https://www.facebook.com/parquegrena/');
  static final Uri _urlInstagram =
      Uri.parse('https://www.instagram.com/parquegrena/');
  static final Uri _urlWebSite = Uri.parse('http://feliz-terra.com/');

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/map.jpg'),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: const Icon(Icons.maps_home_work),
                      ),
                      LargeBoldText(
                        text: 'Adres',
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(45, 5, 0, 10),
                    child: const Text(
                      'Lagoa das, 9675-045.',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            const RowBuilder(
                icon: Icons.facebook,
                text: 'WebSite link here',
                urlLink: 'http://feliz-terra.com/'),
            const RowBuilder(
                icon: Icons.facebook,
                text: 'Facebook link here',
                urlLink: 'http://feliz-terra.com/'),
            const RowBuilder(
                icon: Icons.image,
                text: 'Instagram link here',
                urlLink: 'https://www.instagram.com/parquegrena/'),
          ],
        ),
      );
}

class RowBuilder extends StatelessWidget {
  const RowBuilder({
    required this.icon,
    required this.text,
    required this.urlLink,
    super.key,
  });

  final IconData icon;
  final String text;
  final String urlLink;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Icon(icon),
            ),
            Builder(
              builder: (context) {
                final uri = Uri.tryParse(urlLink);
                if (uri == null) {
                  return const Text('Bad link');
                }
                return Link(
                  uri: uri,
                  builder: (context, followLink) => InkWell(
                    onTap: followLink,
                    child: Text(text),
                  ),
                );
              },
            ),
          ],
        ),
      );
}
