import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/shipment/views/options/options_view.dart';
import 'modal_bottom_sheet.dart';

class ShipmentDeatilsPageDetailed extends StatefulWidget {
  final String orderId;

  const ShipmentDeatilsPageDetailed({super.key, required this.orderId});

  @override
  State<ShipmentDeatilsPageDetailed> createState() =>
      _ShipmentDeatilsPageDetailedState();
}

class _ShipmentDeatilsPageDetailedState
    extends State<ShipmentDeatilsPageDetailed> {
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
        body:
    )
  }
}
