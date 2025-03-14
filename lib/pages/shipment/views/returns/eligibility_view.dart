import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/returns/returns_policy_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class EligibilityView extends StatelessWidget {
  const EligibilityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 29.0, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Report a Return",
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8.0),
              Text(
                "Start a return in just a few steps. Choose your item, select a return method, and get your refund quickly.",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildDateSelector(context, "Thu Jan 30"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text("—",
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                  ),
                  _buildDateSelector(context, "Thu Jan 30", showCheck: true),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(ReturnsPolicyView());
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

  Widget _buildDateSelector(BuildContext context, String date,
      {bool showCheck = false}) {
    return Row(
      children: [
        Icon(Icons.calendar_today, color: Colors.green, size: 18),
        SizedBox(width: 6),
        Text(date,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.green)),
        if (showCheck) ...[
          SizedBox(width: 6),
          Icon(Icons.check, color: Colors.green, size: 18),
        ]
      ],
    );
  }
}
