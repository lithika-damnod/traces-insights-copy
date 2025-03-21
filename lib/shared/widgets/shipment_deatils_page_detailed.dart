import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/shared/widgets/shipment%20details/package_information.dart';
import 'package:traces/shared/widgets/shipment%20details/recipient_information.dart';
import 'package:traces/shared/widgets/shipment%20details/sender_information.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_overview.dart';
import 'package:traces/shared/widgets/shipment%20details/shipping_details.dart';

import '../../pages/shipment/views/options/options_view.dart';
import 'modal_bottom_sheet.dart';

class ShipmentDeatilsPageDetailed extends StatefulWidget {
  final String orderId;
  final String shipmentStatus;

  const ShipmentDeatilsPageDetailed({required this.shipmentStatus,super.key, required this.orderId});

  @override
  State<ShipmentDeatilsPageDetailed> createState() =>
      _ShipmentDeatilsPageDetailedState();
}

class _ShipmentDeatilsPageDetailedState
    extends State<ShipmentDeatilsPageDetailed> {
  double _height = 15;
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
                builder: (context) =>
                    ModalBottomSheet(
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
        body:Padding(
          padding: EdgeInsets.only(top: 5, left: 16.0, right: 16.0, bottom: 30),
          child: ListView(

            children: [
              Text("Shipment Overview",style: TextStyle(fontSize: 19),),
               SizedBox(height: _height,),
              ShipmentOverview( CalenderIcon: Icon(CupertinoIcons.calendar), shipmentStatus: widget.shipmentStatus.toUpperCase(), shiomentId: "TX 768 431", Date: "Thu Jan 30 "),
              Text("Recipient Information",style: TextStyle(fontSize: 19),),
               SizedBox(height: _height),
              RecipientInformation( name: "Lithika Damnod ", address: "Madagalla Road, Polpithigama,Kurunegala, 60620", phoneNumber: "+94 770041341"),
              Text("Sender Information",style: TextStyle(fontSize: 19),),
               SizedBox(height: _height),
              SenderInformation(businessName: "Amazon.com,Inc ", address: "3875 Airways, Module H3 Department 4634, Memphis"
                   , contatctNumber: "+94 714442343"),
              Text("Package  Information",style: TextStyle(fontSize: 19),),
               SizedBox(height: _height),
              PackageInformation(weight: "5KG", packageSize: "Small Bag", dimensions: "30cm x 20cm x 10cm"),
              Text("Shipping Details",style: TextStyle(fontSize: 19),),
               SizedBox(height: _height),
              ShippingDetails(courierName: "FedEx Corporation", paymentMethod: "BankTransfer", paymentStatus: "Paid", totalCost: "LKR 32300")


            ],
          ),
        )
    );
  }
}
