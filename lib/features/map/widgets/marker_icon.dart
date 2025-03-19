import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerIcon {
  final BitmapDescriptor icon;

  MarkerIcon._(this.icon);

  /// Default Google Maps marker
  factory MarkerIcon.defaultIcon() {
    return MarkerIcon._(BitmapDescriptor.defaultMarker);
  }

  /// Loads a custom marker icon from an asset
  static Future<BitmapDescriptor> major() async {
    final BitmapDescriptor icon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(50, 70)),
      "/assets/map/marker.png",
    );
    return icon;
  }

  static Future<BitmapDescriptor> address() async {
    final BitmapDescriptor icon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(50, 70)),
      "/assets/map/address.png",
    );
    return icon;
  }
}
