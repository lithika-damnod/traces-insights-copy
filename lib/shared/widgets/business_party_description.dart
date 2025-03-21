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

 void _setRaitingColor(){
   if(widget.raiting!=null && widget.raiting! >= 4.0){
     _raitingColor = Color(0xFF777D32);
   }else{
     _raitingColor = Colors.white;
   }
 }





 @override
 void initState() {
    _setRaitingColor();
   super.initState();
 }

 @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          child: Stack(
              children: [
                Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 50,

                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: widget.imageUrl != null ? NetworkImage(widget.imageUrl!): NetworkImage(""),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )),
                Positioned(
                  top: 0,
                  left: 70,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Text("${widget.bussinessName} " ,style: TextStyle(fontSize: 19,color: Colors.white.withOpacity(0.9)),),
                      Text("${widget.location} • ${widget.businessType}",style: TextStyle(fontSize: 16,color: Colors.white.withOpacity(0.5)), ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                    top: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.star_fill,color: _raitingColor,size:15),
                    SizedBox(
                      width: 5,
                    ),
                    widget.raiting != null ?
                    Text("${widget.raiting}/5",style: TextStyle(fontSize: 15),) : SizedBox.shrink()
                  ],
                ))
              ],

          ),
        ),
        SizedBox(height:22)

      ],
    );
  }
}
