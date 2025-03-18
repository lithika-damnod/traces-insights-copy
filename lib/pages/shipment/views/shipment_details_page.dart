import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/shipment_details_page.dart';

import '../../../shared/widgets/test.dart';
import '../../../shared/widgets/shipment_details_page_initial.dart';



class ShipmentDetailsPage extends StatefulWidget {
  @override
   _ShipmentDetailsPageState createState() => _ShipmentDetailsPageState();

    const   ShipmentDetailsPage({super.key});
}

class _ShipmentDetailsPageState extends State<ShipmentDetailsPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                ShipmentDetailsPageInitial(orderId: "58"),
                Container(color: Colors.red),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return Container(
                margin: EdgeInsets.all(5),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.white : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
