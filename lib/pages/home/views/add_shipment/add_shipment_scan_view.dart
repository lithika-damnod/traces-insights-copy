// import 'package:flutter/material.dart';
// import 'package:traces/pages/home/views/add_shipment/add_shipment_manual_view.dart';
// import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

// class AddShipmentScanView extends StatelessWidget {
//   const AddShipmentScanView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // TODO: Start replacing content from here
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 26.0),
//           child: Column(
//             children: [
//               Text("Link New Shipment (QR Scan)",
//                   style: TextStyle(fontSize: 18.0)),
//               SizedBox(height: 10.0),
//               ElevatedButton(
//                 onPressed: () {
//                   final modal =
//                       context.findAncestorStateOfType<ModalBottomSheetState>();
//                   modal?.navigateTo(AddShipmentManualView());
//                 },
//                 child: Text("Enter Manually"),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_manual_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class AddShipmentScanView extends StatelessWidget {
  const AddShipmentScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.arrow_turn_up_left,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Text(
            "Provide your shipment details to link it to your account. You can enter the information manually or quickly scan the QR code for faster input.",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 80.0,
                color: Colors.white60,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
