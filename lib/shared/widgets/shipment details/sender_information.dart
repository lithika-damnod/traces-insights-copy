import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_details_row_info.dart';

class SenderInformation extends StatefulWidget {
  final String businessName;
  final String address;
  final String contatctNumber;
  const SenderInformation({super.key, required this.businessName, required this.address, required this.contatctNumber});


  @override
  State<SenderInformation> createState() => _SenderInformationState();
}

class _SenderInformationState extends State<SenderInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        ShipmentDetailsRowInfo(label: "Business Name", value: widget.businessName),
        ShipmentDetailsRowInfo(label: "Address", value: widget.address),
        ShipmentDetailsRowInfo(label: "Contact Number", value: widget.contatctNumber,isPhoneNumber: true,),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
