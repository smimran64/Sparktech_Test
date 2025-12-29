import 'package:flutter/material.dart';
import 'package:sparktech/constants/api_endpoints.dart';
import 'package:sparktech/constants/colors.dart';
import 'package:sparktech/network/api_client.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final otpCtrl = TextEditingController();

  bool loading = false;

  Future<void> verifyOtp(String email) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    final response = await ApiClient.post(
      ApiEndpoints.activateUser,
      {
        "email": email,
        "otp": otpCtrl.text.trim(),
      },
    );

    setState(() => loading = false);

    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP verification failed")),
      );
    }
  }

  @override
  void dispose() {
    otpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email =
    ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OTP sent to $email",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: otpCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter OTP",
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "OTP required";
                  }
                  if (v.length != 6) {
                    return "6 digit OTP required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: loading ? null : () => verifyOtp(email),
                  child: loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Verify OTP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
