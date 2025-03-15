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
    return SingleChildScrollView(
      child: Column(
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
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 1.0),
                            dense: true,
                            title: Text(
                              reason,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                            trailing: selectedReason == reason
                                ? Icon(Icons.check,
                                    color: Color(0xFF0A84FF), size: 24)
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
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final modal = context
                          .findAncestorStateOfType<ModalBottomSheetState>();
                      modal?.navigateTo(ConfirmationView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2C2C2E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      minimumSize: Size(391, 47),
                    ),
                    child: Text(
                      "Submit Request",
                      style: TextStyle(
                        fontSize: 18,
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
      ),
    );
  }
}
