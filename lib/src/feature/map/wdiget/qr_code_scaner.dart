import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:park_app/src/feature/map/wdiget/decoder_widget.dart';

class QrCodeScaner extends StatelessWidget {
  QrCodeScaner({Key? key}) : super(key: key);
  MobileScannerController cameraController = MobileScannerController();
  late Widget findedPlant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Qr code'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
        ],
      ),
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) {
            debugPrint('Fail whit scaning');
          } else {
            final String code = barcode.rawValue!;
            debugPrint('Found! $code');
            findedPlant = DecoderWidget.getCode(code);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      findedPlant), // not sure that its right, coz camera stay activ.
            );
          }
        },
      ),
    );
  }
}
