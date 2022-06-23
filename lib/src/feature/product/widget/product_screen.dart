import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  Widget productWidgenBuilder(
    BuildContext context,
    String productName,
    String productPrice,
    String image12,
    String productInfo,
  ) {
    productName;
    productPrice;
    productInfo;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  LargeBoldText(text: productName),
                  const Spacer(),
                  LargeText(
                    size: 25,
                    text: '${'Price: $productPrice'}€',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Image.asset(
                  image12,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                productInfo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final String prductImage1 = 'assets/images/product1.jpg';

  final String prductImage2 = 'assets/images/product2.jpg';

  final String prductImage3 = 'assets/images/product3.jpg';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: Text(AppLocalizations.of(context)!.services),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: productWidgenBuilder(
                  context,
                  AppLocalizations.of(context)!.canoe,
                  "10",
                  prductImage1,
                  AppLocalizations.of(context)!.canoeDescription,
                ),
              ),
              SizedBox(
                height: 250,
                child: productWidgenBuilder(
                  context,
                  AppLocalizations.of(context)!.pedalBoat,
                  "20",
                  prductImage2,
                  AppLocalizations.of(context)!.pedalBoatDescription,
                ),
              ),
              SizedBox(
                height: 250,
                child: productWidgenBuilder(
                  context,
                  AppLocalizations.of(context)!.bike,
                  "30",
                  prductImage3,
                  AppLocalizations.of(context)!.bikeDescription,
                ),
              ),
            ],
          ),
        ),
      );
}
