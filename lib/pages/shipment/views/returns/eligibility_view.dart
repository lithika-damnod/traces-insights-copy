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
          padding: const EdgeInsets.only(top: 29.0, left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Report a Return",
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10.0),
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
}
