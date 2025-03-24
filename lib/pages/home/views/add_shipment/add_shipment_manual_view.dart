import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/core/constants/api_config.dart';
import 'package:traces/core/services/jwt_service.dart';
import 'package:traces/pages/home/layouts/layout.dart';
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
  String trackingId = "";

  Future<void> linkShipment(String trackingId) async {
    await JwtService()
        .post("${ApiConfig.baseUrl}/api/shipments/$trackingId/link/");
  }

  void _onTrackingChanged(String value) {
    // check validity of the tracking_no
    setState(() {
      checkTrackingNoValidity(value);
      trackingId = value;
    });
  }

  Future<void> checkTrackingNoValidity(String trackingNo) async {
    try {
      final response = await JwtService().get(
        "${ApiConfig.baseUrl}/api/shipments/validate/?id=$trackingNo",
      );

      print("API Response: $response"); // Check what the API is returning

      final responseData = response.data as Map<String, dynamic>;
      bool isValid = responseData['validity'] ?? false;
      print("Tracking Validity: $isValid");
      setState(() {
        _isTrackingEntered = isValid;
      });
    } catch (e) {
      if (kDebugMode) print("Error checking tracking number validity: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleAndInstruction(),
              const SizedBox(height: 16.0),
              TrackingInputField(
                controller: _trackingController,
                onChanged: _onTrackingChanged,
                isTrackingEntered: _isTrackingEntered,
                onClear: () {
                  _trackingController.clear();
                  _onTrackingChanged("");
                },
              ),
              const SizedBox(height: 14.0),
              AddShipmentButton(
                  isEnabled: _isTrackingEntered,
                  onPressed: () {
                    // send request and make it assign to you
                    linkShipment(trackingId);

                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => BaseLayout(),
                        ));
                  }),
            ],
          ),
        ),
        const Positioned(
          right: 8,
          child: QRCodeButton(),
        ),
      ],
    );
  }
}

//TITLE WITH INSTRUCTIONS
class TitleAndInstruction extends StatelessWidget {
  const TitleAndInstruction();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Link New Shipment",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Provide your shipment details to link it to your account. You can enter the information manually or quickly scan the QR code for faster input.",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.4,
            letterSpacing: 1,
            color: Color.fromRGBO(255, 255, 255, 0.6),
          ),
        ),
      ],
    );
  }
}

// QR CODE BUTTON
class QRCodeButton extends StatelessWidget {
  const QRCodeButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: 43.76, //changed the circle size of the icon
        height: 43.76,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[900],
        ),
        child: const Icon(
          CupertinoIcons.qrcode,
          color: Color.fromRGBO(10, 132, 255, 1),
          size: 27.76,
        ),
      ),
      onPressed: () {
        final modal = context.findAncestorStateOfType<ModalBottomSheetState>();
        modal?.navigateTo(AddShipmentScanView());
      },
    );
  }
}

// TRACKING INPUT FIELD
class TrackingInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onClear;
  final bool isTrackingEntered;

  const TrackingInputField({
    required this.controller,
    required this.onChanged,
    required this.onClear,
    required this.isTrackingEntered,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(
        color: Color.fromRGBO(235, 235, 245, 0.8),
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: "Enter Tracking Number",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(235, 235, 245, 0.8),
          fontSize: 17.8,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(28, 28, 30, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isTrackingEntered)
              const Padding(
                padding: EdgeInsets.only(right: 0),
                child: Icon(
                  CupertinoIcons.check_mark,
                  color: Color.fromRGBO(51, 199, 90, 1),
                  size: 20,
                ),
              ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
                size: 21,
              ),
              onPressed: onClear,
            ),
          ],
        ),
      ),
    );
  }
}

// ADD SHIPMENT BUTTON
class AddShipmentButton extends StatelessWidget {
  final bool isEnabled;
  final Function onPressed;

  const AddShipmentButton({required this.isEnabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled
            ? () {
                onPressed();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? Colors.blue : Colors.grey[800],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
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
    );
  }
}
