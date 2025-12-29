import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Your privacy is important to us.\n\n"
              "We do not share your personal data with third parties. "
              "All information is stored securely and used only to improve app functionality.",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
