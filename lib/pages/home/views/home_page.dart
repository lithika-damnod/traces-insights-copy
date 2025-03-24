import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:traces/features/home/services/fetch_shipments_service.dart';
import 'package:traces/features/home/widgets/content.dart';
import 'package:traces/features/home/widgets/no_content.dart';
import 'package:traces/features/home/widgets/top_bar.dart';
import 'package:traces/features/home/util/shipment_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _empty = false;
  bool _loading = true; // Track loading state
  final FetchShipmentsService _fetchShipmentsService = FetchShipmentsService();
  final List<Map<String, dynamic>> _shipments = [];
  Map<String, List<Map<String, dynamic>>> _groupedShipments = {};

  @override
  void initState() {
    _fetchShipments();
    super.initState();
  }

  Future<void> _fetchShipments() async {
    try {
      final shipments = await _fetchShipmentsService.fetchShipments();
      await Future.delayed(const Duration(seconds: 1));

      if (kDebugMode) print("shipments: $shipments");
      setState(() {
        _empty = shipments.isEmpty; // Update empty state
        _loading = false; // Update loading state
      });

      if (shipments.isNotEmpty) {
        final groupedShipments =
            ShipmentUtils.groupAndCountShipments(shipments);
        if (kDebugMode) print("grouped: $groupedShipments");

        setState(() {
          _groupedShipments = groupedShipments['groups'];
        });
      }
    } catch (e) {
      if (kDebugMode) print("Failed to fetch shipments: $e");
      setState(() {
        _loading = true; // Update loading state even if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBar(), // TopBar widget
        Expanded(
          child: _loading
              ? const Center(
                  child: CupertinoActivityIndicator(), // Show loading indicator
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: _empty
                        ? [const NoContent()]
                        : [
                            Content(
                              groupedShipments: _groupedShipments,
                            )
                          ],
                  ),
                ),
        ),
      ],
    );
  }
}
