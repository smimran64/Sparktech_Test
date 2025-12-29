import 'package:flutter/material.dart';
import 'package:sparktech/models/task_model.dart';
import 'package:sparktech/tasks/presentation/dummy_tasks.dart';


class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Tasks")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add-task');
          if (result == true) setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: dummyTasks.length,
        itemBuilder: (context, index) {
          final TaskModel task = dummyTasks[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Text(task.status),
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/task-details',
                  arguments: task,
                );
                if (result == true) setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
