import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/returns/confirmation_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class SelectReasonView extends StatefulWidget {
  const SelectReasonView({super.key});

  @override
  State<SelectReasonView> createState() => _SelectReasonViewState();
}

class _SelectReasonViewState extends State<SelectReasonView> {
  List<String> reasons = [
    "Wrong Item Received",
    "Damaged Item / Defective Item",
    "Defective Item",
    "Item Not as Described",
    "Other Reason"
  ];

  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26.0, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Reason to Return",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: reasons.map((reason) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            reason,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          trailing: selectedReason == reason
                              ? Icon(Icons.check,
                                  color: Color(0xFF0A84FF), size: 20)
                              : null,
                          onTap: () {
                            setState(() {
                              selectedReason = reason;
                            });
                          },
                        ),
                        if (reason != reasons.last)
                          Divider(
                              color: Colors.white.withOpacity(0.2),
                              thickness: 1),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(ConfirmationView());
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
