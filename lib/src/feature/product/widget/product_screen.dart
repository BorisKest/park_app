import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  Widget productWidgenBuilder(productName, productPrice, image1, productInfo) {
    productName;
    productPrice;
    productInfo;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 10, 30, 5),
        decoration: BoxDecoration(
          color: Color.fromARGB(179, 134, 131, 131),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(productName),
                  const Spacer(),
                  Text(productPrice),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: image1,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(productInfo),
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
  Widget build(BuildContext context) => MaterialApp(
        home: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 320.00,
                child: productWidgenBuilder(
                  "Canoe",
                  "10",
                  prductImage1,
                  "You can go on a fantastic adventure on Lake Furnas in one of our canoes...",
                ),
              ),
              SizedBox(
                  height: 320.00,
                  child: productWidgenBuilder(
                    "Canoe",
                    "10",
                    prductImage2,
                    "On our pedal boat you can enjoy a relaxing ride with friends...",
                  )),
              SizedBox(
                  height: 320.00,
                  child: productWidgenBuilder(
                    "Canoe",
                    "10",
                    prductImage3,
                    "E-bikes allow you to ride around the lake in just one hour, without losing any of your energy and allowing you to continue your tour of the azores!",
                  )),
            ],
          ),
        ),
      );
}
