import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';
import 'package:park_app/src/feature/product/widget/product.dart';

import '../../../common/widget/large_bold_text.dart';

class BuildCardWidget extends StatelessWidget {
  const BuildCardWidget({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.image,
    required this.productInfo,
  }) : super(key: key);

  final String productName;
  final String productPrice;
  final String image;
  final String productInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => Product(
                    name: productName,
                    image: image,
                    bodyText: productInfo,
                    price: productPrice,
                  )),
            ),
          );
        },
        child: Card(
          elevation: 3,
          color: Theme.of(context).primaryColor,
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Row(
                  children: [
                    LargeBoldText(text: productName),
                    const Spacer(),
                    LargeText(
                      size: 25,
                      text: '${' $productPrice'}€',
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.2,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(
                  productInfo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
