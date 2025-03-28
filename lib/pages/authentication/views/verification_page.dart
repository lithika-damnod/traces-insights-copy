import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/authentication/authentication.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      children: [
        Center(
          child: Column(
            children: [
              const Text(
                "Verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(213, 255, 255, 255),
                        ),
                      ),
                      child: const Text(
                        "Verify",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
