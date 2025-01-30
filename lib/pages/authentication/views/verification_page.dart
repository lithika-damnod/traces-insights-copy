import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traces/pages/authentication/authentication.dart';
import 'package:traces/shared/widgets/styled_text_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && i < _controllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
        if (_controllers.every((controller) => controller.text.isNotEmpty)) {
          _navigateToForgotPassword();
        }
      });
    }
  }

  void _navigateToForgotPassword() {
    FocusScope.of(context).unfocus(); // Dismiss the keyboard
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ForgotPasswordPage(),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 30),
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
                    color:
                        Colors.white60, // Different color for the email address
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return SizedBox(
                width: 75.0,
                height: 60.0,
                child: StyledTextField(
                  type: "number",
                  placeholder: "",
                  focused: index == 0,
                  compare: null,
                  onSubmitted: (value) {},
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  disableClearIcon: true, // Disable the 'x' icon
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 70.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 20, 20, 20), // Background color
            ),
            onPressed: () {
              // Resend verification logic
            },
            child: Text(
              "Resend code via SMS 01:17",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
