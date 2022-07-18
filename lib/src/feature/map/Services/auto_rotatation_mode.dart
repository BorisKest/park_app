import 'dart:math';

class AutoRotation {
  double currentLatitude;
  double currentLongitude;
  AutoRotation({
    required this.currentLatitude,
    required this.currentLongitude,
  });
  double rotateCamera(currentPosition) {
    double rotation = atan2(currentLatitude, currentLongitude);
    return rotation;
  }
}
