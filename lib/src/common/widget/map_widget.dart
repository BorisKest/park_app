import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;

class MakeMap extends StatefulWidget {
  MakeMap({Key? key}) : super(key: key);
  @override
  State<MakeMap> createState() => _MakeMapState();
}

class _MakeMapState extends State<MakeMap> {
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(urlTemplate: "", additionalOptions: {
          'accessToken': '',
          'id': 'mapbox.mapbox-streets-v8'
        }),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: latLng.LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_searching,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
