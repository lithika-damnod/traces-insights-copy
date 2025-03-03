import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PoliciesPage extends StatefulWidget {
  const PoliciesPage({super.key});

  @override
  State<PoliciesPage> createState() => _PoliciesPageState();
}

class _PoliciesPageState extends State<PoliciesPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white.withOpacity(0.7),
              size: 25.5,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Review Policies and Create Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome to Traces",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Thank you for signing up! Before creating your account please review the following summary of our key terms and policies. ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(153, 255, 255, 255),
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: "By continuing, you agree to these terms.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(198, 255, 255, 255),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Terms of Service
                    Row(
                      children: [
                        Text(
                          "Terms of Service Overview",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(CupertinoIcons.link, size: 15, color: Colors.blue),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "By using our platform, you agree to our Terms of Service. ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(153, 255, 255, 255),
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text:
                                "You are responsible for your account information and ensuring it is used lawfully. ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(198, 255, 255, 255),
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text:
                                "All content is protected by intellectual property laws. We are not liable for any damages resulting from your use of the service. Any violation of these terms may result in immediate termination of your account.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(153, 255, 255, 255),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Privacy Policy
                    Row(
                      children: [
                        Text(
                          "Privacy Policy Overview",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(CupertinoIcons.link, size: 15, color: Colors.blue),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "We collect and use your personal information like name and email address to provide and improve our services. We may share data with trusted partners but never sell it.We use encryption and other security measures to protect your data, ensuring confidentiality and integrity. You can access, update, or delete your data anytime. By using our platform, you agree to our data collection practices.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  // Checkbox Agreement
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "I agree to Terms and Privacy Policy",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isChecked = !_isChecked;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _isChecked ? Colors.blue : Colors.white70,
                              width: 2.5,
                            ),
                            color:
                                _isChecked ? Colors.blue : Colors.transparent,
                          ),
                          width: 25.41,
                          height: 25.41,
                          alignment: Alignment.center,
                          child: _isChecked
                              ? const Icon(CupertinoIcons.checkmark,
                                  color: Colors.white, size: 13)
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Create Account Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isChecked ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor:
                            _isChecked ? Colors.white : Colors.white24,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: _isChecked ? 5 : 0,
                      ),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: _isChecked ? Colors.black : Colors.white38,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
