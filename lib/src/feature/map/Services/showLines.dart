import 'package:latlong2/latlong.dart';
import 'package:park_app/src/feature/map/models/polylins.dart';

class ShowLines {
  List<LatLng> showFirstRoot() {
    if (rootLines1 == lineNull) {
      return lines;
    } else {
      return lineNull;
    }
  }

  List<LatLng> showSecondRoot() {
    if (rootLines2 == lineNull) {
      return lines2;
    } else {
      return lineNull;
    }
  }

  List<LatLng> showThirdRoot() {
    if (rootLines3 == lineNull) {
      return lines3;
    } else {
      return lineNull;
    }
  }
}
