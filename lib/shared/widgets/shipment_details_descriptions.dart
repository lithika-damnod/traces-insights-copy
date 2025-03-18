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
late double discriptionFontSize ;
late  double titleFontSize;
late double fontOpacity;
double _iconSize = 20;




void assignColorAndIcons(String titleSimple){

 switch (titleSimple) {

          case "delivered":
            _textColor = Colors.green;
            icon = Icon(CupertinoIcons.check_mark,
            color: Colors.green,size: _iconSize,);
            description = "The package was successfully delivered to the recipient's address";
            discriptionFontSize =18;
            titleFontSize =16;
            _iconColor = Colors.green;
            fontOpacity =0.6;
            break;

          case "out for delivery":
            _textColor = Colors.white;
            icon =Icon(CupertinoIcons.arrow_right,
            color: Colors.orange,size: _iconSize,);
            description= "The package is with the delivery driver and on its way to the recipient";
            discriptionFontSize =18;
            titleFontSize =16;
            _iconColor = Colors.orange;
            fontOpacity =0.6;
            break;

          case "picked up":
            _textColor = Colors.white;
            icon = Icon(CupertinoIcons.flag_fill,color: Colors.yellow,size: _iconSize,);
            description = "Pending Customer Clearance in ${widget.pickupLocation}";
            discriptionFontSize =18;
            titleFontSize =16;
            _iconColor= Colors.yellow;
            fontOpacity =0.6;
            break;

          default:
            _textColor = Colors.white;
            icon = Icon(CupertinoIcons.arrow_up_left,size: _iconSize,);
            description = widget.address!;
            discriptionFontSize =18;
            titleFontSize =18;
            _iconColor =Colors.white;
            fontOpacity=0.4;

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
              "${widget.shipmentStatus.value}", style: TextStyle(color: _textColor.withOpacity(fontOpacity), fontSize: titleFontSize),
            ),
            SizedBox(
              width: 10,
              height: 0,

            ),
            widget.dateTime != null ? Text("${widget.dateTime}", style: TextStyle(color: _textColor.withOpacity(0.3), fontSize: 17)) : SizedBox.shrink(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 8,
              child: Wrap(
                  children: [
                  Text("$description",style: TextStyle(color: _textColor.withOpacity(  titleSimple !="shipping address"? fontOpacity : 0.7),fontSize: discriptionFontSize)),
                ]
               ),
            ),
            Flexible(
            flex: 2,
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
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
          height: 23,
        )
      ],
    );
  }
}
