import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass {
  getCompass() async {
    final CompassEvent temp = await FlutterCompass.events!.first;
    Stream<double> compasStream() async* {}
  }
}
