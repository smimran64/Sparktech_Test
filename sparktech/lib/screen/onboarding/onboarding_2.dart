import 'package:flutter/material.dart';
import 'package:sparktech/auth/presentation/login_screen.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen())
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Color(0xFF86BC25), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/images2.jpg',
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 40),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Text(
                    "Focus on What matters Most",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E232C),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Set priorities, add deadlines, and sort tasks by importance so you can tackle what truly moves you forward.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // slider point

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const CircleAvatar(radius: 3, backgroundColor: Colors.grey),
                const SizedBox(width: 5),

                Container(
                  width: 25,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF86BC25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 5),

                const CircleAvatar(radius: 3, backgroundColor: Colors.grey),
              ],
            ),

            const Spacer(),

            // next button

            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF86BC25),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/on3'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}