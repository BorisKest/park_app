import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_bold_text.dart';
import 'package:park_app/src/common/widget/large_text.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  Widget productWidgenBuilder(productName, productPrice, image12, productInfo) {
    productName;
    productPrice;
    productInfo;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Container(
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
                      text: 'Price: ' + productPrice + '€',
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
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
                    "Pedal Boat",
                    "20",
                    prductImage2,
                    "On our pedal boat you can enjoy a relaxing ride with friends...",
                  )),
              SizedBox(
                height: 420.00,
                child: productWidgenBuilder(
                  "Bike",
                  "30",
                  prductImage3,
                  "E-bikes allow you to ride around the lake in just one hour, without losing any of your energy and allowing you to continue your tour of the azores!",
                ),
              ),
            ],
          ),
        ),
      );
}
