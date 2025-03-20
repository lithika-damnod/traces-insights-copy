import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_manual_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class AddShipmentScanView extends StatelessWidget {
  const AddShipmentScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Link New Shipment",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: Container(
                  width: 43.56,
                  height: 43.56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[900],
                  ),
                  child: const Icon(
                    CupertinoIcons.arrow_turn_up_left,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(AddShipmentManualView());
                },
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(0, -10),
            child: const Text(
              "Provide your shipment details to link it to your account. You can enter the information manually or quickly scan the QR code for faster input.",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(255, 255, 255, 0.6),
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 310.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 180.0,
                color: Colors.white30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
