import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparktech/models/task_model.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TaskModel task;
  late TextEditingController titleCtrl;
  late TextEditingController descCtrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    task = ModalRoute.of(context)!.settings.arguments as TaskModel;

    titleCtrl = TextEditingController(text: task.title);
    descCtrl = TextEditingController(text: task.description);
  }

  void updateTask() {
    task.title = titleCtrl.text;
    task.description = descCtrl.text;

    Navigator.pop(context); // back to details
    Navigator.pop(context); // back to home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "Title")),
            const SizedBox(height: 16),
            TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: "Description")),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: updateTask,
              child: const Text("Update Task"),
            )
          ],
        ),
      ),
    );
  }
}
