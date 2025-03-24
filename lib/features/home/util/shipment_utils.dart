class ShipmentUtils {
  static Map<String, dynamic> groupAndCountShipments(List<dynamic> shipments) {
    final Map<String, List<Map<String, dynamic>>> groupedShipments = {
      'OTHER': [], // For CREATED and PICKED_UP
      'IN_TRANSIT': [],
      'OUT_FOR_DELIVERY': [],
      'DELIVERED': [],
      'CANCELED': [],
    };

    for (final shipment in shipments) {
      final shipmentMap = shipment as Map<String, dynamic>;
      final status = shipmentMap['status'] as String;

      // Group CREATED and PICKED_UP into "OTHER"
      if (status == 'CREATED' || status == 'PICKED_UP') {
        groupedShipments['OTHER']!.add(shipmentMap);
      } else if (groupedShipments.containsKey(status)) {
        groupedShipments[status]!.add(shipmentMap);
      }
    }

    final Map<String, int> categoryCounts = {};
    groupedShipments.forEach((key, value) {
      categoryCounts[key] = value.length;
    });

    return {
      'groups': groupedShipments,
      'counts': categoryCounts,
    };
  }
}
