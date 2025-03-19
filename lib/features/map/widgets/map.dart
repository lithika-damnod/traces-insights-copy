import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  final LatLng initialPosition;
  final void Function(GoogleMapController) onMapCreated;
  final Set<Marker> markers;

  const Map({
    super.key,
    required this.initialPosition,
    required this.onMapCreated,
    this.markers = const {},
  });

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: widget.initialPosition,
              zoom: 15.0,
            ),
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            markers: widget.markers,
          ),
        ),
      ],
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    widget.onMapCreated(controller);

    try {
      String styleJson = await rootBundle.loadString('assets/map/styles.json');
      _controller?.setMapStyle(styleJson);
    } catch (e) {
      if (kDebugMode) print("error loading map style: $e");
    }
  }
}
