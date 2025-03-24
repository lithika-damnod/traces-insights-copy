import 'package:flutter/material.dart';
import 'package:traces/core/models/group.dart';
import 'package:traces/features/home/widgets/shipment_card.dart';
import 'package:traces/features/home/widgets/shipment_group.dart';
import 'package:intl/intl.dart';

class Content extends StatefulWidget {
  final Map<String, List<Map<String, dynamic>>> groupedShipments;

  const Content({super.key, required this.groupedShipments});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 35.0,
      children: [
        SizedBox(height: 3.0),
        ...widget.groupedShipments.entries.map((entry) {
          final group = entry.key;
          final shipments = entry.value;

          final groupType = _getGroupType(group);

          if (shipments.isNotEmpty) {
            return ShipmentGroup(
              group: groupType,
              children: shipments.map((shipment) {
                return ShipmentCard(
                  type: groupType,
                  identifier: shipment['id'].toString().replaceAll('-', ' '),
                  timestamp: formatDate(shipment['delivery_date']),
                  merchant: shipment['merchant_name'] ?? "",
                  logistics: shipment['logistics_name'] ?? "",
                  description: groupType == Group.inTransit
                      ? shipment['description']
                      : null,
                  bubble: groupType == Group.outForDelivery,
                );
              }).toList(),
            );
          }
          return SizedBox.shrink();
        }),
        SizedBox(height: 20.0),
      ],
    );
  }

  Group _getGroupType(String group) {
    return {
          'OTHER': Group.others,
          'IN_TRANSIT': Group.inTransit,
          'OUT_FOR_DELIVERY': Group.outForDelivery,
          'DELIVERED': Group.delivered,
          'CANCELED': Group.canceled,
        }[group] ??
        Group.others;
  }
}

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return DateFormat('E MMM d').format(date); // "Thu Jan 30"
}
