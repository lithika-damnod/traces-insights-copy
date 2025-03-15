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
          padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Returns Policy",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "We accept returns within 30 days of delivery. Items must be unused, in their original packaging, and include proof of purchase. Certain items, such as final sale, personalized, or perishable goods, cannot be returned.",
                      style:
                          TextStyle(fontSize: 14.0, color: Color(0x99FFFFFF)),
                    ),
                  ),
                  SizedBox(width: 14),
                  Container(
                    width: 2,
                    height: 47,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ],
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0A84FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    minimumSize: Size(391, 47),
                  ),
                  child: Text(
                    "Accept and Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
