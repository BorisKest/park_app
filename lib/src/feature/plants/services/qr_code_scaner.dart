import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:park_app/src/feature/plants/services/decoder_widget.dart';
import 'package:park_app/src/feature/plants/services/sql_helper.dart';
import 'package:park_app/src/feature/plants/widget/one_plant_screen.dart';

class QrCodeScaner extends StatefulWidget {
  const QrCodeScaner({Key? key}) : super(key: key);

  @override
  State<QrCodeScaner> createState() => _QrCodeScanerState();
}

class _QrCodeScanerState extends State<QrCodeScaner> {
  final MobileScannerController cameraController = MobileScannerController();
  List<Map<String, dynamic>> plants = [];

  void setList() async {
    final data = await DBHelper.getItems();
    setState(() {
      plants = data;
    });
  }

  void openPlantScreen(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantScreenBuilder(
          image: plants[index]['image'],
          name: plants[index]['name'],
          descriptionText: plants[index]['description'],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
            int findedPlant = DecoderWidget(code: code, length: plants.length).getCode(code);
            openPlantScreen(findedPlant); // not sure that its right, coz camera stay activ.

          }
        },
      ),
    );
  }
}
