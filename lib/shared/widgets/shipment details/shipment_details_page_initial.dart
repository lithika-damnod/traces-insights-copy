import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/shipment%20details/business_party_description.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_details_page_options.dart';

import 'shipment_details_description.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_status_titles.dart';

class ShipmentDetailsPageInitial extends StatefulWidget {
  final String shipmentStatus;
  final String orderId;
  Map<String, dynamic>? shipmentData;
  List<dynamic>? timeline;

  ShipmentDetailsPageInitial({
    required this.shipmentStatus,
    required this.orderId,
    super.key,
    this.shipmentData,
    this.timeline,
  });

  @override
  State<ShipmentDetailsPageInitial> createState() =>
      _ShipmentDetailsPageInitialState();
}

class _ShipmentDetailsPageInitialState
    extends State<ShipmentDetailsPageInitial> {
  final ScrollController _scrollController = ScrollController();
  bool _applyfade = false;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    final shipment = widget.shipmentData!;
    final recipient = shipment["recipient"] ?? {};
    final address = recipient["address"] ?? {};
    final merchant = shipment["merchant"] ?? {};
    final logistics = shipment["logistics"] ?? {};
    final package = shipment["package"] ?? {};
    final payment = shipment["payment"] ?? {};

    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(0.0),
        backgroundColor: Colors.black,
        middle: Text(
          " ${widget.orderId}",
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
            showShipmentDetailsPageOptions(context: context);
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
            stops: _applyfade ? [0.0, 0.85, 1.0] : [0.0, 1.0],
          ).createShader(rect);
        },
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 5, left: 16.0, right: 16.0, bottom: 15),
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
                                child: titleIcon,
                              ),
                              SizedBox(width: 10),
                              Text(widget.shipmentStatus.toUpperCase(),
                                  style: TextStyle(fontSize: 15.2)),
                            ],
                          ),
                          SizedBox(height: 10),
                          ShipmentDetailsDescription(
                            shipmentStatus: ShipmentStatus.shippingAddress,
                            address:
                                ('${address["address_line_1"]}, ${address["city"]}, ${address["country"]}'),
                          ),
                          //"No.25,Dambulla Road,Kurunegala,North Western,60000"),
                          SizedBox(height: 20),
                          ShipmentDetailsDescription(
                            shipmentStatus: ShipmentStatus.delivered,
                            dateTime: "Mar 22, 11:40 A.M",
                          ),
                          ShipmentDetailsDescription(
                            shipmentStatus: ShipmentStatus.outForDelivery,
                            dateTime: "Mar 19, 11:22 A.M",
                            currentStatus: true,
                          ),
                          ShipmentDetailsDescription(
                            shipmentStatus: ShipmentStatus.pickedUp,
                            pickupLocation: "Yakkala,Sri Lanka",
                            dateTime: "Mar 17, 11:12 A.M",
                          ),
                          BusinessPartyDescription(
                            bussinessName: "Amazon.com, Inc",
                            location: "Sri Lanka",
                            businessType: "E Commerce",
                            raiting: 4.5,
                            imageUrl:
                                "https://1000logos.net/wp-content/uploads/2016/10/Amazon-Logo.png",
                          ),
                          BusinessPartyDescription(
                            bussinessName: "UPS International",
                            location: "Sri Lanka",
                            businessType: "E Commerce",
                            raiting: 3.5,
                            imageUrl:
                                "https://1000logos.net/wp-content/uploads/2021/04/UPS-logo.png",
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
