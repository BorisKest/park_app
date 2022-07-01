import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_app/src/feature/map/wdiget/plants_screen.dart';
import 'package:park_app/src/feature/map/wdiget/promitions.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapShapeSource _mapSource;
  final double _markerSize = 24;
  late MapZoomPanBehavior _zoomPanBehavior;
  Location location = Location();
  LocationData? currentPosition;
  double currentLatitude = 32.7681286;
  double currentLongitude = -25.3317694;

  @override
  void initState() {
    _getLocation();
    _zoomPanBehavior = MapZoomPanBehavior();
    _mapSource = const MapShapeSource.asset(
      'assets/map.json',
      shapeDataField: 'STATE_NAME',
    );

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
    setState(() {});
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfMaps(
              layers: [
                MapShapeLayer(
                  loadingBuilder: (BuildContext context) {
                    return const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    );
                  },
                  source: _mapSource,
                  showDataLabels: true,
                  dataLabelSettings: const MapDataLabelSettings(
                    overflowMode: MapLabelOverflow.ellipsis,
                    textStyle: TextStyle(
                      color: Color.fromRGBO(45, 45, 45, 1),
                    ),
                  ),
                  tooltipSettings: const MapTooltipSettings(
                    color: Colors.white,
                  ),
                  initialMarkersCount: 1,
                  markerBuilder: (BuildContext context, int index) {
                    return MapMarker(
                      latitude: currentLatitude,
                      longitude: currentLongitude,
                      offset: Offset(0, -_markerSize / 2),
                      size: Size(_markerSize, _markerSize * 2),
                      child: const Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(199, 42, 89, 1),
                      ),
                    );
                  },
                  zoomPanBehavior: _zoomPanBehavior,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                chekPromitions(context);
              },
              child: const Text('Scan qr'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlantsScreen(
                      openIndex: 0,
                    ),
                  ),
                );
              },
              child: const Text('See all plants'),
            ),
          ],
        ),
      ),
    );
  }
}
