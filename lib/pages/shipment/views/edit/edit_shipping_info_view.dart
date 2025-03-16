// import 'package:flutter/material.dart';
// import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
// import 'package:traces/pages/shipment/views/edit/view_addresses_view.dart';
// import 'package:traces/pages/shipment/views/edit/view_shipping_info_view.dart';
// import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
//
// class EditShippingInformationView extends StatelessWidget {
//   const EditShippingInformationView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: Start replacing content from here
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: const [
//         Padding(
//           padding: EdgeInsets.only(top: 26.0),
//           child: Column(
//             children: [
//               Text(
//                 "Update Shipping Address",
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: "SF Pro Text"),
//               ),
//               SizedBox(height: 10.0),
//
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
// import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
//
// class EditShippingInformationView extends StatelessWidget {
//   const EditShippingInformationView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(
//         maxHeight: MediaQuery.of(context).size.height * 0.9, // Expands modal to 90% of the screen
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 30.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           /// **Header with title**
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Update Shipping Address",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                   fontFamily: "SF Pro Text",
//                 ),
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.add, color: Colors.white),
//                     onPressed: () {
//                       // Handle additional actions here
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           SizedBox(height: 20),
//
//           /// **Input Fields**
//           _buildTextField("Street Address Line 1", "No. 50, Madagalla Road"),
//           _buildTextField("Street Address Line 2", "No. 50, Madagalla Road"),
//           _buildTextField("City", "Kurunegala"),
//           _buildTextField("Province", "North Western"),
//           _buildTextField("Country", "Sri Lanka", isEditable: false), // Country is disabled
//
//           SizedBox(height: 20),
//
//           /// **Button at the bottom**
//           _buildElevatedButton(
//             context,
//             text: "Locate Address",
//             onPressed: () {
//               final modal = context.findAncestorStateOfType<ModalBottomSheetState>();
//               modal?.navigateTo(PinLocationView());
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// **Reusable TextField Widget**
//   Widget _buildTextField(String label, String hint, {bool isEditable = true}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: TextFormField(
//         initialValue: hint,
//         enabled: isEditable,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.grey[400]),
//           filled: true,
//           fillColor: Colors.grey[900],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide.none,
//           ),
//           suffixIcon: isEditable ? Icon(Icons.clear, color: Colors.white) : null,
//         ),
//       ),
//     );
//   }
//
//   /// **Reusable Button**
//   Widget _buildElevatedButton(BuildContext context, {
//     required String text,
//     required VoidCallback onPressed,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xFF0A84FF),
//           padding: EdgeInsets.symmetric(vertical: 14.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14.0),
//           ),
//         ),
//         onPressed: onPressed,
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontFamily: "SF Pro Text",
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
// import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
//
// class EditShippingInformationView extends StatelessWidget {
//   const EditShippingInformationView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     /// **Dynamically calculate modal height based on content**
//     double modalHeight = MediaQuery.of(context).size.height * 0.85; // Adjust for full content fit
//
//     return ModalBottomSheet(
//       showCloseButton: false, // Hide default close button
//       //background: Color(0xFF1C1C1E), // Adjusted to match the right-side UI
//
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min, // Ensures only necessary height is used
//           children: [
//             /// **Title + Actions**
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Update Shipping Address",
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                     fontFamily: "SF Pro Text",
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.add, color: Colors.white),
//                       onPressed: () {
//                         // Handle add action
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 10),
//
//             /// **Form Fields**
//             _buildTextField("Street Address Line 1", "No. 50, Madagalla Road"),
//             _buildTextField("Street Address Line 2", "No. 50, Madagalla Road"),
//             _buildTextField("City", "Kurunegala"),
//             _buildTextField("Province", "North Western"),
//             _buildTextField("Country", "Sri Lanka", isEditable: false),
//
//             SizedBox(height: 20),
//
//             /// **Button pinned at the bottom**
//             _buildElevatedButton(
//               context,
//               text: "Locate Address",
//               onPressed: () {
//                 final modal = context.findAncestorStateOfType<ModalBottomSheetState>();
//                 modal?.navigateTo(PinLocationView());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// **Reusable TextField Widget (Matches Right-Side UI)**
//   Widget _buildTextField(String label, String hint, {bool isEditable = true}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14.0,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 6.0),
//           TextFormField(
//             initialValue: hint,
//             enabled: isEditable,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Color(0xFF2C2C2E), // Darker field background
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0), // Matches right-side UI
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: isEditable
//                   ? Icon(Icons.clear, color: Colors.white) // Only editable fields have clear icon
//                   : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// **Reusable Button (Matches Right-Side UI)**
//   Widget _buildElevatedButton(BuildContext context, {
//     required String text,
//     required VoidCallback onPressed,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xFF0A84FF), // Bright blue button
//           padding: EdgeInsets.symmetric(vertical: 14.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0), // Rounded button edges
//           ),
//         ),
//         onPressed: onPressed,
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontFamily: "SF Pro Text",
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
// import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
//
// class EditShippingInformationView extends StatelessWidget {
//   const EditShippingInformationView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ModalBottomSheet(
//       background: Color(0xFF121212),
//       showCloseButton: true,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             /// **Title + Actions**
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Update Shipping Address",
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                     fontFamily: "SF Pro Text",
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.add, color: Colors.white),
//                       onPressed: () {
//                         // Handle additional actions
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 20),
//
//             /// **Form Fields**
//             _buildTextField("Street Address Line 1", "No. 50, Madagalla Road"),
//             _buildTextField("Street Address Line 2", "No. 50, Madagalla Road"),
//             _buildTextField("City", "Kurunegala"),
//             _buildTextField("Province", "North Western"),
//             _buildTextField("Country", "Sri Lanka", isEditable: false),
//
//             SizedBox(height: 20),
//
//             /// **Button pinned at the bottom**
//             Spacer(),
//             _buildElevatedButton(
//               context,
//               text: "Locate Address",
//               onPressed: () {
//                 final modal = context.findAncestorStateOfType<ModalBottomSheetState>();
//                 modal?.navigateTo(PinLocationView());
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// **Reusable TextField Widget**
//   Widget _buildTextField(String label, String hint, {bool isEditable = true}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: TextFormField(
//         initialValue: hint,
//         enabled: isEditable,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.grey[400]),
//           filled: true,
//           fillColor: Colors.grey[800],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide.none,
//           ),
//           suffixIcon: isEditable ? Icon(Icons.clear, color: Colors.white) : null,
//         ),
//       ),
//     );
//   }
//
//   /// **Reusable Button**
//   Widget _buildElevatedButton(BuildContext context, {
//     required String text,
//     required VoidCallback onPressed,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xFF0A84FF),
//           padding: EdgeInsets.symmetric(vertical: 14.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14.0),
//           ),
//         ),
//         onPressed: onPressed,
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontFamily: "SF Pro Text",
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/custom_text_field.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';

class EditShippingInformationView extends StatelessWidget {
  const EditShippingInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Update Shipping Address",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "SF Pro Text",
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),

            SizedBox(height: 5),

            /// **Form Fields**
            CustomTextField(
                label: "Street Address Line 1", hint: "No. 50, Madagalla Road"),
            CustomTextField(
                label: "Street Address Line 2", hint: "No. 50, Madagalla Road"),
            CustomTextField(label: "City", hint: "Kurunegala"),
            CustomTextField(label: "Province", hint: "North Western"),
            CustomTextField(
                label: "Country", hint: "Sri Lanka", isEditable: false),

            SizedBox(height: 20),

            /// **Button pinned at the bottom**
            CustomElevatedButton(
              text: "Locate Address",
              onPressed: () {
                final modal =
                    context.findAncestorStateOfType<ModalBottomSheetState>();
                modal?.navigateTo(PinLocationView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
