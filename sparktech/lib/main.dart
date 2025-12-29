import 'package:flutter/material.dart';
import 'package:sparktech/auth/presentation/login_screen.dart';
import 'package:sparktech/auth/presentation/otp_screen.dart';
import 'package:sparktech/auth/presentation/reset_password_screen.dart';
import 'package:sparktech/auth/presentation/signup_screen.dart';
import 'package:sparktech/auth/presentation/verify_email_screen.dart';
import 'package:sparktech/home/home_screen.dart';
import 'package:sparktech/profile/account_settings_screen.dart';
import 'package:sparktech/profile/edit_profile_screen.dart';
import 'package:sparktech/profile/help_screen.dart';
import 'package:sparktech/profile/privacy_screen.dart';
import 'package:sparktech/profile/profile_screen.dart';
import 'package:sparktech/profile/term_screen.dart';
import 'package:sparktech/screen/onboarding/onboarding_1.dart';
import 'package:sparktech/screen/onboarding/onboarding_2.dart';

import 'package:sparktech/screen/onboarding/onboarding_3.dart';
import 'package:sparktech/screen/splash/splash_screen.dart';
import 'package:sparktech/tasks/presentation/add_task_screen.dart';
import 'package:sparktech/tasks/presentation/edit_task_screen.dart';
import 'package:sparktech/tasks/presentation/task_details_screen.dart';
import 'package:sparktech/tasks/presentation/task_list_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/on1': (_) => const Onboarding1(),
        '/on2': (_) => const Onboarding2(),
        '/on3': (_) => const Onboarding3(),
        '/login': (_) => LoginScreen(),
        '/register': (_) => RegisterScreen(),
        '/verify-email': (_) => VerifyEmailScreen(),
        '/otp': (_) => OtpScreen(),
        '/home': (_) => const TaskListScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/account': (_) => const AccountSettingsScreen(),
        '/change-password': (_) => const ChangePasswordScreen(),
        '/edit-profile': (_) => const EditProfileScreen(),
        '/terms': (_) => const TermsScreen(),
        '/help': (_) => const HelpScreen(),
        '/privacy': (_) => const PrivacyScreen(),
        '/tasks': (_) => const TaskListScreen(),
        '/add-task': (_) => AddTaskScreen(),
        '/task-details': (_) => const TaskDetailsScreen(),
        '/edit-task': (_) => const EditTaskScreen(),
        '/home': (_) => const HomeScreen()

      },
    );
  }
}
