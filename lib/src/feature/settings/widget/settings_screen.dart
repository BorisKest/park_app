import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:park_app/src/common/widget/utils.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blueGrey),
                    child: Row(
                      children: [
                        Container(child: Icon(Icons.language)),
                        Container(
                          child: Text('language'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
