import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isEditable;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.isEditable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.40),
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              fontFamily: "SF Pro Text",
              letterSpacing: -0.408,
            ),
          ),
          SizedBox(height: 6.0),
          TextFormField(
            initialValue: hint,
            enabled: isEditable,
            style: TextStyle(
              color: Color.fromRGBO(235, 235, 245, 0.60),
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontFamily: "SF Pro Text",
              letterSpacing: -0.408,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16, 11, 0, 11),
              filled: true,
              fillColor: Color.fromRGBO(28, 28, 30, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: isEditable
                  ? Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.cancel,
                        color: Color(0xFF8E8E93),
                        size: 18,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
