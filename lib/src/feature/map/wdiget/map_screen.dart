import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/feature/map/wdiget/qr_code_scaner.dart';
import 'package:park_app/src/feature/map/wdiget/plants_screen.dart';
import 'package:park_app/src/common/widget/map_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(AppLocalizations.of(context)!.map),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              child: MakeMap(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QrCodeScaner()),
                );
              },
              child: Container(
                child: Text('Sacan qr'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlantsScreen(
                            openIndex: 0,
                          )),
                );
              },
              child: Container(
                child: Text('See all plants'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
