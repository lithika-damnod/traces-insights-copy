import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traces/features/map/services/location_service.dart';
import 'package:traces/features/map/widgets/map.dart';
import 'package:traces/features/map/widgets/title_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  StreamSubscription? _locationSubscription;

  LatLng? _currentPosition;
  final LatLng _defaultCenter =
      const LatLng(7.821603639133135, 80.406256487888);

  @override
  void initState() {
    super.initState();
    _setupLocationTracking();
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
      ),
    );
  }
}
