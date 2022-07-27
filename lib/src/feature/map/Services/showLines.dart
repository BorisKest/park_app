import 'package:latlong2/latlong.dart';
import 'package:park_app/src/feature/map/models/polylins.dart';

class ShowLines {
  bool isRootsShown;

  ShowLines({required this.isRootsShown});
  final nullRoot = <LatLng>[LatLng(0, 0)];

  bool setBool() {
    if (isRootsShown == false) {
      isRootsShown = true;
      return isRootsShown;
    } else {
      isRootsShown = false;
      return isRootsShown;
    }
  }

  List<LatLng> showFirstRoot() {
    if (isRootsShown == false) {
      isRootsShown = true;
      return lines;
    } else {
      isRootsShown = false;
      return nullRoot;
    }
  }

  List<LatLng> showSecondRoot() {
    if (isRootsShown == false) {
      isRootsShown = true;
      return lines2;
    } else {
      isRootsShown = false;
      return nullRoot;
    }
  }

  List<LatLng> showThirdRoot() {
    if (isRootsShown == false) {
      isRootsShown = true;
      return lines3;
    } else {
      isRootsShown = false;
      return nullRoot;
    }
  }
}
