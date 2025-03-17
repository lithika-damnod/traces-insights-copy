import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/circular_icon_button.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';

class ViewAddressesView extends StatefulWidget {
  const ViewAddressesView({super.key});

  @override
  State<ViewAddressesView> createState() => _ViewAddressesViewState();
}

class _ViewAddressesViewState extends State<ViewAddressesView> {
  int? selectedAddressIndex; // No address selected initially
  final List<String> addresses = [
    "No. 25, Dambulla Road, Kurunegala, North Western 60000, Sri Lanka",
    "75/1, Colombo Road, Kurunegala, North Western 60000, Sri Lanka",
    "Malpitiya Junction, Kurunegala, North Western 60000, Sri Lanka",
  ];

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
                style: TextStyle(
                    fontSize: 15.3,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    fontWeight: FontWeight.w400,
                    fontFamily: "SF Pro Text"),
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
                    SizedBox(width: 164.0),
                    Icon(
                      CupertinoIcons.add,
                      size: 20.0,
                      color: Color(0xFF0A84FF),
                    ),
                  ],
                ),
              ),
              Text(
                "Saved Addresses Within Service Area",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(217, 217, 217, 0.5),
                  fontFamily: "SF Pro Text",
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: List.generate(addresses.length, (index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            addresses[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: selectedAddressIndex == index
                              ? Icon(CupertinoIcons.checkmark,
                                  color: Color(0xFF0A84FF))
                              : SizedBox(
                                  width:
                                      24), // Ensure space remains even if no checkmark
                          onTap: () {
                            setState(() {
                              selectedAddressIndex = index;
                            });
                          },
                        ),
                        if (index < addresses.length - 1)
                          Divider(color: Colors.grey[700], height: 1),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 30.0),
              CustomElevatedButton(
                text: "Save Changes",
                onPressed: selectedAddressIndex == null ? null : () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
