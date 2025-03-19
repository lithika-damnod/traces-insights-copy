import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_scan_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart'
    as ModalBottomSheetWrapper;
import 'package:flutter/cupertino.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title and QR Code Icon
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Link New Shipment",
                  style: TextStyle(
                    fontSize: 21,
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
                    child: const Icon(CupertinoIcons.qrcode,
                        color: Color.fromRGBO(10, 132, 255, 1), size: 23.76),
                  ),
                  onPressed: () {
                    final modal = context.findAncestorStateOfType<
                        ModalBottomSheetWrapper.ModalBottomSheetState>();
                    modal?.navigateTo(AddShipmentScanView());
                  },
                ),
              ],
            ),
          ),

          Text(
            "Provide your shipment details to link it to your account. You can enter the information manually or quickly scan the QR code for faster input.",
            style: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ),
          SizedBox(height: 16.0),

          // Input Field
          TextField(
            controller: _trackingController,
            onChanged: _onTrackingChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter Tracking Number",
              hintStyle: const TextStyle(
                color: Color.fromRGBO(235, 235, 245, 0.6),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: Color.fromRGBO(28, 28, 30, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isTrackingEntered)
                    const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Icon(CupertinoIcons.check_mark,
                          color: Color.fromRGBO(51, 199, 90, 1), size: 20),
                    ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.xmark_circle_fill,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      _trackingController.clear();
                      _onTrackingChanged("");
                    },
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 14.0),

          // Add Shipment Button
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
