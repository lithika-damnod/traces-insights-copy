import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShipmentDetailsRowInfo extends StatefulWidget {
  final String label;
  final  Icon? icon;
  final String value;
  final Color? iconColor;
  final bool isPhoneNumber;

  const ShipmentDetailsRowInfo({
    super.key,
    required this.label,
    this.icon,
    required this.value,
    this.iconColor,
    this.isPhoneNumber = false,
  });

  @override
  State<ShipmentDetailsRowInfo> createState() => _ShipmentDetailsRowInfoState();
}




class _ShipmentDetailsRowInfoState extends State<ShipmentDetailsRowInfo> {



    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Aligns text at the top
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 18,
              ),
            ),
            SizedBox(width: 40, height: 0,),
            Expanded(
              //flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // Aligns items to the right
                children: [
                  if (widget.icon != null &&
                      widget.icon?.icon != CupertinoIcons.calendar)
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.iconColor != null ? widget.iconColor!
                              .withOpacity(0.2) : IconTheme
                              .of(context)
                              .color!
                              .withOpacity(0.2)
                        //IconTheme.of(context).color,
                      ),
                      child: Icon(
                          widget.icon!.icon, size: 20, color: widget.iconColor),
                    )
                  else
                    if (widget.icon?.icon == CupertinoIcons.calendar)
                      Icon(widget.icon!.icon,size: 20,),

                  const SizedBox(width: 10),

                  Flexible(
                    child: Text(
                      widget.value,
                      textAlign: TextAlign.right,
                      softWrap: true,
                      overflow: TextOverflow.visible, // Ensures wrapping
                      style: widget.isPhoneNumber
                          ? const TextStyle(color: Colors.blue, fontSize: 18)
                          : TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

