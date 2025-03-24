import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traces/features/map/services/location_service.dart';
import 'package:traces/features/map/widgets/map.dart';
import 'package:traces/features/map/widgets/marker_icon.dart';
import 'package:traces/features/map/widgets/title_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  StreamSubscription? _locationSubscription;
  Set<Marker> myMarkers = {};

  LatLng? _currentPosition;
  final LatLng _defaultCenter =
      const LatLng(7.821603639133135, 80.406256487888);

  Future<void> _loadMarkers() async {
    BitmapDescriptor customIcon = await MarkerIcon.major();
    BitmapDescriptor addressIcon = await MarkerIcon.address();

    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(6.9271, 79.8612),
        infoWindow: const InfoWindow(title: "Colombo"),
        icon: customIcon, // Now we can use the custom icon
      ),
      Marker(
        markerId: const MarkerId("2"),
        position: LatLng(7.5620, 79.8017),
        infoWindow: const InfoWindow(title: "Halawatha"),
        icon: customIcon, // Now we can use the custom icon
      ),
      Marker(
        markerId: const MarkerId("3"),
        position: LatLng(7.4818, 80.3609),
        infoWindow: const InfoWindow(title: "Kurunegala"),
        icon: customIcon, // Now we can use the custom icon
      ),
      Marker(
        markerId: const MarkerId("4"),
        position: LatLng(7.821603639133135, 80.406256487888),
        infoWindow: const InfoWindow(title: "Polpithigama"),
        icon: addressIcon, // Now we can use the custom icon
      ),
    };

    setState(() {
      myMarkers = markers;
    });
  }

  @override
  void initState() {
    super.initState();
    _setupLocationTracking();
    _loadMarkers();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _setupLocationTracking() async {
    Position? initialPosition = await LocationService.getInitialPosition();
    if (initialPosition != null) {
      setState(
        () {
          _currentPosition =
              LatLng(initialPosition.latitude, initialPosition.longitude);
        },
      );
    } else {
      setState(
        () {
          _currentPosition = _defaultCenter;
        },
      );
    }

    _locationSubscription = LocationService.listenToLocationUpdates(
      (Position pos) {
        LatLng newPosition = LatLng(pos.latitude, pos.longitude);

        setState(
          () {
            _currentPosition = newPosition;
          },
        );

        _mapController?.animateCamera(CameraUpdate.newLatLng(newPosition));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: TitleBar(),
      body: Map(
        initialPosition: _currentPosition ?? _defaultCenter,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        markers: myMarkers,
      ),
    );
  }
}
