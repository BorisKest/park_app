import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  Widget productWidgenBuilder(productName, productPrice, image1) {
    productName;
    productPrice;
    Image image1;

    return Scaffold(
      body: Container(
        height: 320.00,
        margin: const EdgeInsets.fromLTRB(30, 10, 30, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(productName),
            Text(productPrice),
            // Image(image: image1)
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(
              height: 320.00,
              child: productWidgenBuilder(
                  "Canoe", "10", Image.asset("assets/images/product1.jpg")),
            ),
            SizedBox(
                height: 320.00,
                child: productWidgenBuilder(
                    "Canoe", "10", Image.asset("assets/images/product1.jpg"))),
            SizedBox(
                height: 320.00,
                child: productWidgenBuilder(
                    "Canoe", "10", Image.asset("assets/images/product1.jpg"))),
          ]),
        ),
      );
}
