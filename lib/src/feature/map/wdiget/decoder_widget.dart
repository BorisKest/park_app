import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:park_app/src/feature/map/wdiget/plants_screen.dart';

class DecoderWidget {
  DecoderWidget({required this.code});
  final String code;

  static getCode(String code) {
    switch (code) {
      case 'Plant1':
        return const PlantsScreen(
          openIndex: 0,
        );
      case 'Plant2':
        return const PlantsScreen(
          openIndex: 1,
        );
      case 'Plant3':
        return const PlantsScreen(
          openIndex: 2,
        );
      case 'Plant4':
        return const PlantsScreen(
          openIndex: 3,
        );
    }
  }
}
