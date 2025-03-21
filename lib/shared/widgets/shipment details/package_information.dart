import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_details_row_info.dart';

class PackageInformation extends StatefulWidget {
  final String weight;
  final String packageSize;
  final String dimensions;

  const PackageInformation(
      {super.key,
      required this.weight,
      required this.packageSize,
      required this.dimensions});

  @override
  State<PackageInformation> createState() => _PackageInformationState();
}

class _PackageInformationState extends State<PackageInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShipmentDetailsRowInfo(label: "Weight", value: widget.weight),
        ShipmentDetailsRowInfo(
            label: "Package Size", value: widget.packageSize),
        ShipmentDetailsRowInfo(label: "Dimensions", value: widget.dimensions),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
