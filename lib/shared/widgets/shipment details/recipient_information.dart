import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_details_row_info.dart';

class RecipientInformation extends StatefulWidget {
  final String name;
  final String address;
  final String phoneNumber;

  const RecipientInformation({super.key, required this.name, required this.address, required this.phoneNumber});

  @override
  State<RecipientInformation> createState() => _RecipientInformationState();
}

class _RecipientInformationState extends State<RecipientInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShipmentDetailsRowInfo(label: "Name", value: "${widget.name}"),
        ShipmentDetailsRowInfo(label: "Address", value: "${widget.address}"),
        ShipmentDetailsRowInfo(label: "Contact Number", value: "${widget.phoneNumber}",isPhoneNumber: true,),
        SizedBox(
          height: 30,
        )
      ],


    );
  }
}
