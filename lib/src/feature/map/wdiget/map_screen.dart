import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final double _markerSize = 24;
  Location location = Location();
  LocationData? currentPosition;
  double currentLatitude = 32.7681286;
  double currentLongitude = -25.3317694;
  static const String _heroMark = 'show_marker_info';

  //  List<LatLng> pointList = [
  //  LatLng(37.769495, -25.337934),
  //  LatLng(37.770096, -25.336740),
  //  LatLng(37.769520, -25.336879),
  //  LatLng(37.769399, -25.335963),
  //  LatLng(37.769832, -25.335416),
  //  LatLng(37.769272, -25.335319),
  //  LatLng(37.768071, -25.334812),
  //  LatLng(37.767961, -25.334361),
  //  LatLng(37.766326, -25.335566),
  //  LatLng(37.766635, -25.335263),
  //  LatLng(37.765392, -25.333311),
  //  LatLng(37.766094, -25.333657),
  //  LatLng(37.767870, -25.333355)
  //  ];
  late final MapController mapController;

  @override
  void initState() {
    mapController = MapController();
    _getLocation();

    super.initState();
    location.onLocationChanged.listen(
      (value) {
        setState(
          () {
            currentPosition = value;
            if (currentPosition != null) {
              currentLatitude = currentPosition!.latitude!;
              currentLongitude = currentPosition!.longitude!;
            }
          },
        );
      },
    );
  }

  void _getCurrentPosition() async {
    currentPosition = await _getLocation();
    if (currentPosition != null) {
      currentLatitude = currentPosition!.latitude!;
      currentLongitude = currentPosition!.longitude!;
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<LocationData> _getLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return _getLocation();
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return _getLocation();
      }
    }
    return currentPosition = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    currentPosition == null ? Container() : _getCurrentPosition();

    //in case that you use the HomeScreen as Screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(AppLocalizations.of(context)!.map),
      ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(37.768449, -25.332746),
            zoom: 13.0,
            maxZoom: 19.0,
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              tileProvider: NonCachingNetworkTileProvider(),
              tileBounds: LatLngBounds(
                LatLng(37.781144, -25.359088),
                LatLng(37.725494, -25.302919),
              ),
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  point: LatLng(currentLatitude, currentLongitude),
                  builder: (context) => const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                ),
                Marker(
                  point: LatLng(37.769495, -25.337934),
                  builder: (context) => Hero(
                    tag: _heroMark,
                    child: const Icon(Icons.location_pin),
                  ),
                ),
                Marker(
                  point: LatLng(37.770096, -25.336740),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.769520, -25.336879),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.769399, -25.335963),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.769832, -25.335416),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.769272, -25.335319),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.768071, -25.334812),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.767961, -25.334361),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.766326, -25.335566),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.766635, -25.335263),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.765392, -25.333311),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.766094, -25.333657),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
                Marker(
                  point: LatLng(37.767870, -25.333355),
                  builder: (context) => const Icon(Icons.location_pin),
                ),
              ],
            ),
          ],
          children: [],
        ),
      ),
    );
  }
}
