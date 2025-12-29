import 'package:flutter/material.dart';
import 'package:sparktech/auth/presentation/login_screen.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ১. উপরের বার (Back button এবং Skip)
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

            // ২. মাঝখানের ইমেজ (pubspec.yaml অনুযায়ী আপডেট করা হয়েছে)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/images3.jpg', // .png এর জায়গায় .jpg হবে আপনার ফাইল অনুযায়ী
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 40),

            // ৩. টাইটেল এবং সাবটাইটেল
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Text(
                    "Visualize Progress, Stay on Track",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E232C),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Monitor completed tasks, ongoing projects, and upcoming deadlines -- all in a clear, visual format.",
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

            // ৪. স্লাইডার ইন্ডিকেটর (বিন্দুগুলো)
        // ৪. স্লাইডার ইন্ডিকেটর (৩য় পেজের জন্য)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ১ম টি এখন গোল এবং ধূসর
            const CircleAvatar(radius: 3, backgroundColor: Colors.grey),
            const SizedBox(width: 5),

            // ২য় টি গোল এবং ধূসর
            const CircleAvatar(radius: 3, backgroundColor: Colors.grey),
            const SizedBox(width: 5),

            // ৩য় টি এখন লম্বা এবং সবুজ (Active)
            Container(
              width: 25,
              height: 6,
              decoration: BoxDecoration(
                color: const Color(0xFF86BC25),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),

            const Spacer(),

            // ৫. নিচের নেক্সট বাটন
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF86BC25),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/login'),
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