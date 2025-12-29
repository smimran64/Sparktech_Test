import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparktech/models/task_model.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as TaskModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/edit-task',
                arguments: task,
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title,
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            Text(task.description,
                style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            Row(
              children: [
                const Text("Status: ",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(task.status,
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "Created at: ${task.createdAt}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
