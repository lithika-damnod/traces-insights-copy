import 'package:flutter/material.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_scan_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class AddShipmentManualView extends StatefulWidget {
  const AddShipmentManualView({super.key});

  @override
  _AddShipmentManualViewState createState() => _AddShipmentManualViewState();
}

class _AddShipmentManualViewState extends State<AddShipmentManualView> {
  final TextEditingController _trackingController = TextEditingController();
  bool _isTrackingEntered = false;

  void _onTrackingChanged(String value) {
    setState(() {
      _isTrackingEntered = value.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title Row with QR Code Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Link New Shipment",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: Container(
                  width: 43.76,
                  height: 43.76,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[900],
                  ),
                  child: const Icon(Icons.qr_code,
                      color: Colors.blueAccent, size: 23.76),
                ),
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(AddShipmentScanView());
                },
              ),
            ],
          ),

          SizedBox(height: 8.0),

          Text(
            "Provide your shipment details to link it to your account. You can enter the information manually or quickly scan the QR code for faster input.",
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 15.299999237060547,
              color: Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ),
          SizedBox(height: 16.0),

          // Input Field with Checkmark or Clear Button
          TextField(
            controller: _trackingController,
            onChanged: _onTrackingChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter Tracking Number",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isTrackingEntered)
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(Icons.check_circle,
                          color: Colors.green, size: 22),
                    ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      _trackingController.clear();
                      _onTrackingChanged("");
                    },
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.0),

          // Add Shipment Button (Disabled when empty)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isTrackingEntered ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isTrackingEntered ? Colors.blue : Colors.grey[800],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              child: const Text(
                "Add Shipment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
