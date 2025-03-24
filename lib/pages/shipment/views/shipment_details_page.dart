import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/features/home/services/fetch_shipments_service.dart';
import 'package:traces/shared/widgets/shipment%20details/shipment_deatils_page_detailed.dart';
import '../../../shared/widgets/shipment details/shipment_details_page_initial.dart';

class ShipmentDetailsPage extends StatefulWidget {
  final String shipmentId;

  @override
  _ShipmentDetailsPageState createState() => _ShipmentDetailsPageState();

  const ShipmentDetailsPage({super.key, required this.shipmentId});
}

class _ShipmentDetailsPageState extends State<ShipmentDetailsPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  bool loaded = false;
  Map<String, dynamic>? response;
  List<dynamic>? timeline;

  @override
  void initState() {
    // fetch shipment information
    _fetchShipmentInfo();
    super.initState();
  }

  Future<void> _fetchShipmentInfo() async {
    response =
        await FetchShipmentsService().fetchShipmentsById(widget.shipmentId);
    timeline =
        await FetchShipmentsService().fetchShipmentTimeline(widget.shipmentId);

    print("timeline: $timeline");
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: !loaded
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Column(
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
                      ShipmentDetailsPageInitial(
                        orderId: widget.shipmentId,
                        shipmentStatus: "in transit",
                        shipmentData: response,
                        timeline: timeline,
                      ),
                      ShipmentDeatilsPageDetailed(
                        orderId: widget.shipmentId,
                        shipmentStatus: "in transit",
                      ),
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
                        color:
                            _currentIndex == index ? Colors.white : Colors.grey,
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
