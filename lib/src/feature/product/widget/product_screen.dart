import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/feature/product/widget/card_builder.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
              SizedBox(
                height: 300,
                child: BuildCardWidget(
                  productName: AppLocalizations.of(context)!.canoe,
                  productPrice: "10",
                  image: prductImage1,
                  productInfo: AppLocalizations.of(context)!.canoeDescription,
                ),
              ),
              SizedBox(
                height: 300,
                child: BuildCardWidget(
                  productName: AppLocalizations.of(context)!.pedalBoat,
                  productPrice: "20",
                  image: prductImage2,
                  productInfo: AppLocalizations.of(context)!.pedalBoatDescription,
                ),
              ),
              SizedBox(
                height: 300,
                child: BuildCardWidget(
                  productName: AppLocalizations.of(context)!.bike,
                  productPrice: "30",
                  image: prductImage3,
                  productInfo: AppLocalizations.of(context)!.bikeDescription,
                ),
              ),
            ],
          ),
        ),
      );
}
