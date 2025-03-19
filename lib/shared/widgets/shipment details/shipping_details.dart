import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_details_row_info.dart';

class ShippingDetails extends StatefulWidget {
  final String  courierName;
  final String  paymentMethod;
  final String  paymentStatus;
  final String  totalCost;

  const ShippingDetails({super.key,required this.courierName,required this.paymentMethod,required  this.paymentStatus,required this.totalCost});

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ShipmentDetailsRowInfo(label: "CourierName", value: widget.courierName),
        ShipmentDetailsRowInfo(label: "Payment Method", value: widget.paymentMethod),
        ShipmentDetailsRowInfo(label: "Payment Status", value: widget.paymentStatus),
        ShipmentDetailsRowInfo(label: "Total Cost", value: widget.totalCost),
        SizedBox(
          height: 30,
        )
      ],


    );
  }
}
