import 'package:flutter/material.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26.0, left: 25.0, right: 25.0),
          child: Column(
            children: [
              Icon(
                Icons.check_circle,
                size: 50,
                color: Color(0xFF0A84FF),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Expected Pickup Date",
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 14),
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Thu Jan 30",
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.0),
              Text(
                "Your return request has been received",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(height: 14.0),
              Text(
                "A driver will come to pick up your return item from your provided address. Please ensure the item is securely packed and ready for collection.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white.withOpacity(
                    0.6,
                  ),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
