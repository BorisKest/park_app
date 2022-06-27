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
  var location = new Location();
  late LocationData _locationData;

  @override
  void initState() {
    _getLocation();
    _zoomPanBehavior = MapZoomPanBehavior();

    _mapSource = MapShapeSource.asset(
      'assets/map.json',
      shapeDataField: 'STATE_NAME',
    );

    super.initState();

    location.onLocationChanged.listen(
      (value) {
        setState(
          () {
            _locationData = value;
          },
        );
      },
    );
  }

  Future<LocationData?> _getLocation() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await location.getLocation();
  }

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
            SfMaps(
              layers: [
                MapShapeLayer(
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
                      latitude: _locationData.latitude!,
                      longitude: _locationData.longitude!,
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
