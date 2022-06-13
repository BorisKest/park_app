import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Link(
            target: LinkTarget.blank,
            uri: Uri.parse('https://flutter.dev'),
            builder: (context, followLink) => ElevatedButton(
              onPressed: followLink,
              child: Text('sad'),
            ),
          ),
        ),
      );
}
