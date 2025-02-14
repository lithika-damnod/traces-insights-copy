import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traces/pages/authentication/authentication.dart';
import 'package:traces/pages/authentication/cubit/activity_indicator_cubit.dart';
import 'package:traces/shared/widgets/styled_text_field.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Enter Your Password",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),

        BlocBuilder<ActivityIndicatorCubit, bool>(builder: (context, state) {
          return StyledTextField(
            placeholder: "Password",
            type: "password",
            focused: true,
            onSubmitted: (value) {
              context.read<ActivityIndicatorCubit>().toggle();
              Timer(
                const Duration(seconds: 3),
                () {
                  context.read<ActivityIndicatorCubit>().toggle();
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const PoliciesPage()),
                  );
                },
              );
            },
          );
        }),
        const SizedBox(height: 38),

        // Sign In Button
        BlocBuilder<ActivityIndicatorCubit, bool>(
          builder: (context, loading) {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withAlpha((0.9 * 255).toInt()),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 11,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  context.read<ActivityIndicatorCubit>().toggle();
                  Timer(
                    const Duration(seconds: 3),
                    () {
                      context.read<ActivityIndicatorCubit>().toggle();
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const PoliciesPage(),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(height: 23),

        // Forgot Password Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[900],
              foregroundColor: Colors.white60,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const VerificationPage()),
              );
            },
            child: const Text(
              "Forgot Password",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
