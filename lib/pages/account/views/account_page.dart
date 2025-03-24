import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/core/services/authentication_service.dart';
import 'package:traces/pages/authentication/views/authentication_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          AuthenticationService(Dio()).logout();
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const AuthenticationPage(),
            ),
          );
        },
        child: const Text("Logout"),
      ),
    );
  }
}
