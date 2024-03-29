import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Product extends StatelessWidget {
  final String name;
  final String image;
  final String bodyText;
  final String price;

  const Product({
    Key? key,
    required this.name,
    required this.image,
    required this.bodyText,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Row(
          children: [
            LargeBoldText(
              text: name,
              size: 25,
            ),
            const Spacer(),
            Text('$price €'),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(image),
              const Divider(),
              Text(bodyText),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  AppLocalizations.of(context)!.boatRoot,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              InteractiveViewer(
                child: Image.asset(
                  'assets/images/root.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
