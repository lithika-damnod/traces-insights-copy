import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/shipment/views/options/options_view.dart';
import 'package:traces/shared/widgets/business_party_description.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/shared/widgets/order_confirmation_view.dart';

import '../../../shared/widgets/shipment_details_descriptions.dart';
import 'package:traces/shared/widgets/shipment_details_titles.dart';

class ShipmentDetailsPageInitial extends StatefulWidget {
  final String orderId;
  const ShipmentDetailsPageInitial({required this.orderId, super.key});

  @override
  State<ShipmentDetailsPageInitial> createState() => _ShipmentDetailsPageInitialState();
}

class _ShipmentDetailsPageInitialState extends State<ShipmentDetailsPageInitial> {

  final ScrollController _scrollController = ScrollController();
  bool _applyfade =  false;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (_){
      _checkScrollPosition();
    });

    _scrollController.addListener(_checkScrollPosition);
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScrollPosition() {
    if (_scrollController.hasClients) {
      setState(() {
        _applyfade = _scrollController.position.maxScrollExtent >
            _scrollController.position.pixels;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(0.0),
        backgroundColor: Colors.black,
        middle: Text(
          " #${widget.orderId}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        leading: Navigator.of(context).canPop()
            ? CupertinoNavigationBarBackButton(
          color: Color(0xFF0A84FF),
          previousPageTitle: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        )
            : null,
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ModalBottomSheet(
                child: OptionsView(),
              ),
            );
          },
          icon: Icon(
            CupertinoIcons.ellipsis_circle,
            size: 24.0,
            color: Color(0xFF0A84FF),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ShaderMask(

        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _applyfade
                ? [Colors.white, Colors.white, Colors.transparent]
                : [Colors.white, Colors.white],
            stops: _applyfade ? [0.0, 0.8, 1.0] : [0.0, 1.0],
          ).createShader(rect);
        },

        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 16.0, right: 16.0, bottom: 30),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFCDD93C).withOpacity(0.2),
                                ),
                                child: Icon(
                                  CupertinoIcons.flag_fill,
                                  color: Color(0xFFCDD93C),
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("IN TRANSIT", style: TextStyle(fontSize: 15.2)),
                            ],
                          ),
                          SizedBox(height: 10),
                          ShipmentDetailsDescription(
                            shipmentStatus: ShipmentStatus.shippingAddress,
                            address: "No.249/1,Kurunduwatta,Koskandawala,Yakkala",
                          ),
                          SizedBox(height: 150),
                          ShipmentDetailsDescription(shipmentStatus: ShipmentStatus.delivered),
                          ShipmentDetailsDescription(shipmentStatus: ShipmentStatus.outForDelivery),
                          ShipmentDetailsDescription(
                            shipmentStatus: ShipmentStatus.pickedUp,
                            pickupLocation: "Yakkala,Sri Lanka",
                            dateTime: "April 22, 11:40 A.M",
                          ),
                          BusinessPartyDescription(
                            bussinessName: "Amazon Inc",
                            location: "Sri Lanka",
                            businessType: "E Commerce",
                            raiting: 4.5,
                            imageUrl: "https://www.github.com/DihanWanasinghe.png",
                          ),
                          BusinessPartyDescription(
                            bussinessName: "Amazon Inc",
                            location: "Sri Lanka",
                            businessType: "E Commerce",
                            raiting: 4.5,
                          ),
                          BusinessPartyDescription(
                            bussinessName: "Amazon Inc",
                            location: "Sri Lanka",
                            businessType: "E Commerce",
                            raiting: 4.5,
                          ),
                          BusinessPartyDescription(
                            bussinessName: "Amazon Inc",
                            location: "Sri Lanka",
                            businessType: "E Commerce",
                            raiting: 4.5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Gradient Fade Effect at Bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
