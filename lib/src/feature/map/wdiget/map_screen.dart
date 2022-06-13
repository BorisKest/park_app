import 'dart:math';

import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset('assets/images/map.jpg'),
              ),
              const SizedBox(
                height: 200,
                width: 400,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                //               Container(
                //                  Padding(
                //                   padding: EdgeInsets.only(
                //                     top: 12,
                //                   ),
                //                   child: Text('data'),
                //                 ),
                //               ),
              ),
            ],
          ),
        ),
      );
}
