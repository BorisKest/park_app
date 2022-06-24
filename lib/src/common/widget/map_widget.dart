import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

class MakeMap extends StatefulWidget {
  const MakeMap({Key? key}) : super(key: key);
  @override
  State<MakeMap> createState() => _MakeMapState();
}

class _MakeMapState extends State<MakeMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: lat_lng.LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(urlTemplate: "", additionalOptions: {'accessToken': '', 'id': 'mapbox.mapbox-streets-v8'}),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: lat_lng.LatLng(51.5, -0.09),
              builder: (ctx) => const FlutterLogo(),
            ),
          ],
        ),
      ],
    );
  }
}
