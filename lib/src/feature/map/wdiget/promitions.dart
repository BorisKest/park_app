import 'package:flutter/material.dart';
import 'package:park_app/src/feature/map/wdiget/qr_code_scaner.dart';
import 'package:permission_handler/permission_handler.dart';

void chekPromitions(context) async {
  var status = await Permission.camera.status;

  if (status.isDenied) {
    openAppSettings();
  }
  if (await Permission.camera.request().isGranted) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QrCodeScaner()),
    );
  }
}
