import 'package:flutter/material.dart';
import 'package:sparktech/auth/presentation/login_screen.dart';
import 'package:sparktech/tasks/presentation/task_list_screen.dart';


class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (_) => LoginScreen(),
    '/tasks': (_) => const TaskListScreen(),
  };
}
