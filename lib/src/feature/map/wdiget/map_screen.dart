import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:park_app/src/common/widget/utils.dart';
import 'package:park_app/src/feature/map/models/markers.dart';
import 'package:park_app/src/feature/map/models/polylins.dart';
import 'package:park_app/src/feature/map/wdiget/roots_popup.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  Location location = Location();
  LocationData? currentPosition;
  double currentLatitude = 32.7681286;
  double currentLongitude = -25.3317694;
  double previousHading = 0.0;

  bool autoRotation = false;

  late final MapController mapController;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _getLocation();
    _getHeading(controller);
    location.onLocationChanged.listen(
      (value) {
        setState(
          () {
            currentPosition = value;
            if (currentPosition != null) {
              currentLatitude = currentPosition!.latitude!;
              currentLongitude = currentPosition!.longitude!;
              _getLocation();
            }
          },
        );
      },
    );
  }

  void _getHeading(controller) {
    if (FlutterCompass.events != null) {
      final subscription = FlutterCompass.events!.listen(null);
      subscription.onData(
        (data) {
          if (autoRotation == true) {
            double x = 0.0;
            var animatedHeading = Tween<double>(begin: previousHading, end: data.heading)
                .animate(CurvedAnimation(parent: controller, curve: Curves.linear)); //something wrong ...
            animatedHeading.addListener(() {
              setState(() {
                x = animatedHeading.value;
                print(x);
              });
            });
            mapController.rotate(animatedHeading.value);

            previousHading = data.heading!;
          } else {
            subscription.cancel();
          }
        },
      );
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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          RootPopUp(),
        ],
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(AppLocalizations.of(context)!.map),
      ),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: mediaQueryData.size.height,
              child: FlutterMap(
                mapController: mapController,
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

                  PolylineLayerOptions(
                    polylines: [
                      Polyline(
                        strokeWidth: 5,
                        points: rootLines1,
                        color: Colors.blue,
                      ),
                      Polyline(
                        strokeWidth: 5,
                        points: rootLines2,
                        color: Colors.orange,
                      ),
                      Polyline(
                        strokeWidth: 5,
                        points: rootLines3,
                        color: Colors.red,
                      ),
                    ],
                  ),

                  MapMarkers().setMarkers(), //static markers
                  MarkerLayerOptions(
                    // current location marker
                    markers: [
                      Marker(
                        point: LatLng(currentLatitude, currentLongitude),
                        rotate: true,
                        builder: (context) => const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      Marker(
                        width: 100,
                        rotate: true,
                        point: LatLng(37.768168, -25.332367),
                        builder: ((context) => Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Theme.of(context).secondaryHeaderColor,
                            child: Center(child: const Text('Entry / Exit')))),
                      ),
                    ],
                  ),
                ],
                children: const [],
              ),
            ),
            Positioned(
              //auto rotation
              left: 15,
              bottom: 15,
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: () {
                  setState(() {
                    if (autoRotation == false) {
                      autoRotation = true;
                      _getHeading(controller);
                    } else {
                      autoRotation = false;
                      _getHeading(controller);
                    }
                  });
                },
                child: const Icon(Icons.gps_fixed),
              ),
            ),
            Positioned(
              // credits to OSM
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
                    'OpenStreetMap contributors',
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
