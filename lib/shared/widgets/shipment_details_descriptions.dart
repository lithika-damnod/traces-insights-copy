import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/shared/widgets/shipment_details_titles.dart';





class ShipmentDetailsDescription extends StatefulWidget {
  final ShipmentStatus shipmentStatus;
  final String? dateTime;
  final String? address;
  final String? pickupLocation;
  const ShipmentDetailsDescription({super.key, required this.shipmentStatus, this.dateTime, this.address,  this.pickupLocation});

  @override
  State<ShipmentDetailsDescription> createState() => _ShipmentDetailsDescriptionState();
}

class _ShipmentDetailsDescriptionState extends State<ShipmentDetailsDescription> {
late String titleSimple;
late Color _textColor;
late Icon icon;
 late Color _iconColor ;
late String description;




void assignColorAndIcons(String titleSimple){

 switch (titleSimple) {

          case "delivered":
            _textColor = Colors.green;
            icon = Icon(CupertinoIcons.check_mark_circled,
            color: Colors.green,);
            description = "The package was successfully delivered to the recipient's address";
            _iconColor = Colors.green;
            break;

          case "out for delivery":
            _textColor = Colors.white;
            icon =Icon(CupertinoIcons.arrow_right,
            color: Colors.orange,);
            description= "The package is with the delivery driver and on its way to the recipient";
            _iconColor = Colors.orange;
            break;

          case "picked up":
            _textColor = Colors.white;
            icon = Icon(CupertinoIcons.flag_fill,color: Colors.yellow);
            description = "Pending Customer Clearance in ${widget.pickupLocation}";
            _iconColor= Colors.yellow;
            break;

          default:
            _textColor = Colors.white;
            icon = Icon(CupertinoIcons.arrow_up_left);
            description = widget.address!;
            _iconColor =Colors.white;

        }

}



  @override
  void initState() {
    super.initState();
    titleSimple = widget.shipmentStatus.value.toLowerCase();
    assignColorAndIcons(titleSimple);
  }
  @override
  Widget build(BuildContext context) {

    return  Column (
      children: [

        Row(
          children: [
            Text(
              "${widget.shipmentStatus.value}", style: TextStyle(color: _textColor),
            ),
            SizedBox(
              width: 10,
              height: 0,

            ),
            widget.dateTime != null ? Text("${widget.dateTime}", style: TextStyle(color: _textColor)) : SizedBox.shrink(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 5,
              child: Wrap(
                  children: [
                  Text("$description",style: TextStyle(color: _textColor)),
                ]
               ),
            ),
            Flexible(
            flex: 2,
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: icon,
                ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _iconColor.withOpacity(0.2)),
            ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
