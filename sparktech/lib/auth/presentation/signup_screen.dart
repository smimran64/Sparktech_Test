import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sparktech/constants/api_endpoints.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final firstNameController = TextEditingController();
  final lastNameController  = TextEditingController();
  final emailController     = TextEditingController();
  final passwordController  = TextEditingController();

  bool loading = false;

  Future<void> register(BuildContext context) async {
    try {
      setState(() => loading = true);

      final uri = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.register);
      print("Hitting: $uri");

      final request = http.MultipartRequest('POST', uri);
      request.fields['firstName'] = firstNameController.text.trim();
      request.fields['lastName']  = lastNameController.text.trim();
      request.fields['email']     = emailController.text.trim();
      request.fields['password']  = passwordController.text.trim();

      print("Sending request...");
      final response = await request.send()
          .timeout(const Duration(seconds: 15));

      print("Response received");

      final body = await response.stream.bytesToString();
      print("STATUS: ${response.statusCode}");
      print("BODY: $body");

      setState(() => loading = false);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pushNamed(context, '/otp',
            arguments: emailController.text.trim());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(body)));
      }
    } catch (e) {
      setState(() => loading = false);
      print("ERROR: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Server not responding")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: "First Name"),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : () => register(context),
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
