import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/authentication/authentication.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of FocusNodes for the four input fields
    final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());


    return AuthenticationLayout(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: RichText(
            text: const TextSpan(
              text: "We've sent a verification code to your email address ",
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Default text color
              ),
              children: [
                TextSpan(
                  text: "(info@lithika.com)", // The email address
                  style: TextStyle(
                    color: Colors.grey, // Different color for the email address
                    fontWeight: FontWeight.normal, // Optional: Make it bold
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 31.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 9.5),
                width: 75.0,
                height: 60.0,
                child: TextField(
                  focusNode: focusNodes[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 1, // Limits input to one character
                  decoration: InputDecoration(
                    counterText: '', // Hides character counter
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                        color: Colors.blue, // Changes border color to blue
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 3) {
                      // Move to the next box if a number is entered
                      FocusScope.of(context)
                          .requestFocus(focusNodes[index + 1]);
                    } else if (value.isNotEmpty && index == 3) {
                      // Hide the keyboard on the last box
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: TextButton(
            onPressed: () {
              // Resend verification logic
            },
            child: const Text(
              "Resend code via SMS",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 500.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.9),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 11,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const ForgotPasswordPage(),
                ),
              );
            },
            child: const Text(
              "Verify",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
