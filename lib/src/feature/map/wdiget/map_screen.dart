import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:park_app/src/common/widget/utils.dart';
import 'package:park_app/src/feature/map/wdiget/popup_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location location = Location();
  LocationData? currentPosition;
  double currentLatitude = 32.7681286;
  double currentLongitude = -25.3317694;

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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(AppLocalizations.of(context)!.map),
      ),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: mediaQueryData.size.height,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(37.768449, -25.332746),
                  maxZoom: 19.0,
                  bounds: LatLngBounds(
                    LatLng(37.770278, -25.339618),
                    LatLng(37.764454, -25.329514),
                  ),
                  maxBounds: LatLngBounds(
                    LatLng(37.773741, -25.341170),
                    LatLng(37.758501, -25.319407),
                  ),
                  interactiveFlags: InteractiveFlag.all,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    tileProvider: NetworkTileProvider(),
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
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle1,
                            image: 'assets/images/marker1.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody1,
                            heroMark: '1'),
                      ),
                      Marker(
                        point: LatLng(37.770000, -25.336750),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle2,
                            image: 'assets/images/marker2.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody2,
                            heroMark: '2'),
                      ),
                      Marker(
                        point: LatLng(37.769520, -25.336879),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle3,
                            image: 'assets/images/backgroundMain.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody3,
                            heroMark: '3'),
                      ),
                      Marker(
                        point: LatLng(37.769399, -25.335963),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle4,
                            image: 'assets/images/marker4.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody4,
                            heroMark: '4'),
                      ),
                      Marker(
                        point: LatLng(37.769832, -25.335416),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle5,
                            image: 'assets/images/marker5.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody5,
                            heroMark: '5'),
                      ),
                      Marker(
                        point: LatLng(37.769272, -25.335319),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle6,
                            image: 'assets/images/marker6.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody6,
                            heroMark: '6'),
                      ),
                      Marker(
                        point: LatLng(37.768071, -25.334812),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle7,
                            image: 'assets/images/marker7.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody7,
                            heroMark: '7'),
                      ),
                      Marker(
                        point: LatLng(37.766326, -25.335566),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle8,
                            image: 'assets/images/marker8.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody8,
                            heroMark: '8'),
                      ),
                      Marker(
                        point: LatLng(37.766635, -25.335263),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle9,
                            image: 'assets/images/marker9.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody9,
                            heroMark: '9'),
                      ),
                      Marker(
                        point: LatLng(37.765392, -25.333311),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle10,
                            image: 'assets/images/marker10.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody10,
                            heroMark: '10'),
                      ),
                      Marker(
                        point: LatLng(37.766094, -25.333657),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle11,
                            image: 'assets/images/marker11.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody11,
                            heroMark: '11'),
                      ),
                      Marker(
                        point: LatLng(37.767961, -25.334361),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle12,
                            image: 'assets/images/marker12.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody12,
                            heroMark: '12'),
                      ),
                      Marker(
                        point: LatLng(37.767870, -25.333355),
                        builder: (context) => PopupMarker(
                            titleText: AppLocalizations.of(context)!.markerTitle13,
                            image: 'assets/images/marker13.jpg',
                            bodyText: AppLocalizations.of(context)!.markerBody13,
                            heroMark: '13'),
                      ),
                    ],
                  ),
                ],
                children: const [],
              ),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: SizedBox(
                height: 25,
                child: ElevatedButton(
                  onPressed: () => Utils.openLink(url: Uri.parse('https://www.openstreetmap.org/copyright')),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white24,
                    elevation: 0,
                    padding: const EdgeInsets.all(5),
                    textStyle: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                  child: const Text(
                    'Map data from OpenStreetMap',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
