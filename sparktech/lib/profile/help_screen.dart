import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "If you face any issues while using the app, please contact our support team.\n\n"
              "Email: support@sparktech.com\n"
              "Phone: +880 1234 567890",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
