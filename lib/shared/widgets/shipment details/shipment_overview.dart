import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_details_row_info.dart';

class ShipmentOverview extends StatefulWidget {
  final Icon shipmentStatusIcon;
  final Icon CalenderIcon;
  final String shipmentStatus;
  final String shiomentId;
  final String Date;
  const ShipmentOverview({super.key, required this.shipmentStatusIcon, required this.CalenderIcon, required this.shipmentStatus, required this.shiomentId, required this.Date});

  @override
  State<ShipmentOverview> createState() => _ShipmentOverviewState();
}

class _ShipmentOverviewState extends State<ShipmentOverview> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ShipmentDetailsRowInfo(label: "Status", value: widget.shipmentStatus, icon: widget.shipmentStatusIcon, iconColor: Color(0xFFCDD93C)),
        ShipmentDetailsRowInfo(label: "Shipment Id", value: widget.shiomentId),
        ShipmentDetailsRowInfo(label: "Estimated Delivery Date ", value: widget.Date, icon: widget.CalenderIcon),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
