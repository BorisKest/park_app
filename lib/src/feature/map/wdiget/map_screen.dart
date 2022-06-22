import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/feature/map/wdiget/qr_code_scaner.dart';
import 'package:park_app/src/feature/map/wdiget/plants_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: Text(AppLocalizations.of(context)!.map),
        ),
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
                    color: Colors.white38,
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
