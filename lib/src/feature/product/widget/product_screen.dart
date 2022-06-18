import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  Widget productWidgenBuilder(String productName, String productPrice,
      Image image12, String productInfo) {
    productName;
    productPrice;
    productInfo;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(146, 105, 165, 214),
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
            Container(
              margin: const EdgeInsets.all(10),
              child: image12,
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

  var prductImage1 = Image.asset('assets/images/product1.jpg');
  var prductImage2 = Image.asset('assets/images/product2.jpg');
  var prductImage3 = Image.asset('assets/images/product3.jpg');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.services),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 320.00,
                child: productWidgenBuilder(
                  AppLocalizations.of(context)!.canoe,
                  "10",
                  prductImage1,
                  AppLocalizations.of(context)!.canoeDescription,
                ),
              ),
              SizedBox(
                  height: 320.00,
                  child: productWidgenBuilder(
                    AppLocalizations.of(context)!.pedalBoat,
                    "20",
                    prductImage2,
                    AppLocalizations.of(context)!.pedalBoatDescription,
                  )),
              SizedBox(
                height: 420.00,
                child: productWidgenBuilder(
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
