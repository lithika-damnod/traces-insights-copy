import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_details_row_info.dart';

class ShipmentOverview extends StatefulWidget {
  final Icon CalenderIcon;
  final String shipmentStatus;
  final String shiomentId;
  final String Date;
  const ShipmentOverview(
      {super.key,
      required this.CalenderIcon,
      required this.shipmentStatus,
      required this.shiomentId,
      required this.Date});

  @override
  State<ShipmentOverview> createState() => _ShipmentOverviewState();
}

class _ShipmentOverviewState extends State<ShipmentOverview> {
  Icon? titleIcon;

  void assignTitleIcon() {
    switch (widget.shipmentStatus.toLowerCase()) {
      case "in transit":
        titleIcon = Icon(
          CupertinoIcons.flag_fill,
          color: Color(0xFFCDD93C),
          size: 20,
        );
        break;

      case "delivered":
        titleIcon = Icon(
          CupertinoIcons.check_mark,
          color: Colors.green,
          size: 20,
        );
        break;

      case "canceled":
        titleIcon = Icon(
          CupertinoIcons.clear_circled,
          size: 20,
          color: CupertinoColors.systemRed,
        );
        break;

      default:
        titleIcon = null;
    }
  }

  @override
  void initState() {
    super.initState();
    assignTitleIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShipmentDetailsRowInfo(
            label: "Status",
            value: widget.shipmentStatus,
            icon: titleIcon,
            iconColor: Color(0xFFCDD93C)),
        ShipmentDetailsRowInfo(label: "Shipment Id", value: widget.shiomentId),
        ShipmentDetailsRowInfo(
            label: "Estimated Delivery Date ",
            value: widget.Date,
            icon: widget.CalenderIcon),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
