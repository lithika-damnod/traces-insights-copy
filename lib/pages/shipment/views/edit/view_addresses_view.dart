import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/circular_icon_button.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';

class ViewAddressesView extends StatelessWidget {
  const ViewAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 21.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Use A Different Address",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
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
                      modal?.navigateTo(PinLocationView());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                "Here are your saved addresses that are eligible for deliveries. Only locations within the service area will be displayed.",
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(EditShippingInformationView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Enter New Address",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0A84FF),
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Icon(Icons.add, size: 18.0),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              Column(
                children: [
                  _addressTile(
                      "No. 25, Dambulla Road, Kurunegala, North Western 60000, Sri Lanka"),
                  _addressTile(
                      "75/1, Colombo Road, Kurunegala, North Western 60000, Sri Lanka"),
                  _addressTile(
                      "Malpitiya Junction, Kurunegala, North Western 60000, Sri Lanka"),
                ],
              ),
              const SizedBox(height: 30.0),
              CustomElevatedButton(
                text: "Save Changes",
                onPressed: () {},
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.blue,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8.0),
              //       ),
              //       padding: EdgeInsets.symmetric(vertical: 14.0),
              //     ),
              //     onPressed: () {},
              //     child: Text(
              //       "Save Changes",
              //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _addressTile(String address) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                address,
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ),
            Icon(CupertinoIcons.checkmark, color: Color(0xFF0A84FF)),
            const SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }
}
