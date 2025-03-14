import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/returns/select_reason_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class ReturnsPolicyView extends StatelessWidget {
  const ReturnsPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Returns Policy",
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10.0),
              Text(
                "We accept returns within 30 days of delivery. Items must be unused, in their original packaging, and include proof of purchase. Certain items, such as final sale, personalized, or perishable goods, cannot be returned.",
                style: TextStyle(fontSize: 14.0, color: Color(0x99FFFFFF)),
              ),
              SizedBox(height: 12.0),
              Text(
                "Returns can be made by dropping off the item at a designated location or scheduling a courier pickup if eligible. Refunds will be processed to the original payment method within 5–10 business days after the return is received and inspected. If the return is due to a damaged or incorrect item, we will cover the return shipping costs.",
                style: TextStyle(fontSize: 14.0, color: Color(0x99FFFFFF)),
              ),
              SizedBox(height: 12.0),
              Text(
                "For any return-related issues, please contact our support team within 7 days of receiving your item.",
                style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(SelectReasonView());
                  },
                  child: Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
