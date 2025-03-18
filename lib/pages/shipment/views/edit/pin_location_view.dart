// import 'package:flutter/material.dart';
// import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
// import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
// import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';
// import 'package:traces/features/shipment/widgets/circular_icon_button.dart';
//
// class PinLocationView extends StatelessWidget {
//   const PinLocationView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 26.0),
//           child: Column(
//             children: [
//               Text(
//                 "Pin Address Location (Map)",
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 10.0),
//               ElevatedButton(
//                 onPressed: () {
//                   final modal =
//                       context.findAncestorStateOfType<ModalBottomSheetState>();
//                   modal?.navigateTo(EditShippingInformationView());
//                 },
//                 child: Text("Back"),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/edit/view_addresses_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';
import 'package:traces/features/shipment/widgets/circular_icon_button.dart';

class PinLocationView extends StatelessWidget {
  const PinLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// **Header Section**
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pin Your Address",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "SF Pro Text",
                  ),
                ),
                CircularIconButton(
                  icon: CupertinoIcons.arrow_uturn_left,
                  iconColor: Color(0xFF8E8E93),
                  backgroundColor: Color(0xFF1C1C1E),
                  onPressed: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(EditShippingInformationView());
                  },
                ),
              ],
            ),
          ),

          /// **Subtitle**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Make sure your pinned location is accurate and within the service area.",
              style: TextStyle(
                fontSize: 15.3,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
                fontFamily: "SF Pro Text",
              ),
            ),
          ),
          SizedBox(height: 20.0),

          /// **Search Bar**

          SizedBox(height: 17.0),

          /// **Map Preview**
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/icons/map_pin.png', // Replace with actual map asset
              width: double.infinity,
              height: 500,
              fit: BoxFit.cover,
            ),
          ),

          /// **Save Changes Button**
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomElevatedButton(
              text: "Save Changes",
              onPressed: () {
                final modal =
                    context.findAncestorStateOfType<ModalBottomSheetState>();
                modal?.navigateTo(ViewAddressesView());
              },
            ),
          ),
        ],
      ),
    );
  }
}
