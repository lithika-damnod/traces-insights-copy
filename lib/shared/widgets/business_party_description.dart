import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessPartyDescription extends StatefulWidget {
  final String bussinessName;
  final String location;
   final String? businessType;
  final double? raiting;
   final String? imageUrl;
  const BusinessPartyDescription({super.key, required this.bussinessName, required this.location,  this.businessType,  this.raiting, this.imageUrl});

  @override
  State<BusinessPartyDescription> createState() => _BusinessPartyDescriptionState();
}



class _BusinessPartyDescriptionState extends State<BusinessPartyDescription> {

 late  Color _raitingColor;
 late Color  _locationColor;
   Color?  _bussinessTypeColor;
   late double opacity;


 @override
 void initState() {
   super.initState();
 }

 @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 1)
      ),
      child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: 50,

                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.imageUrl != null ? NetworkImage(widget.imageUrl!): NetworkImage(""),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 1),
                  ),
                )),
            Positioned(
              top: 0,
              left: 70,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  Text("${widget.bussinessName} " ,),
                  Text("${widget.location} • ${widget.businessType}", ),
                ],
              ),
            ),
            Positioned(
              right: 0,
                top: 4,
                child: Row(
              children: [
                Icon(CupertinoIcons.star_fill),
                SizedBox(
                  width: 5,
                ),
                widget.raiting != null ?
                Text("${widget.raiting}/5") : SizedBox.shrink()
              ],
            ))
          ],

      ),
    );
  }
}
