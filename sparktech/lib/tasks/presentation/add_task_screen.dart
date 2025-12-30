import 'package:flutter/material.dart';
import 'dummy_tasks.dart';
import '../../models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  // --- APNAR ORIGINAL LOGIC (Unchanged) ---
  void saveTask() {
    if (titleCtrl.text.isEmpty || descCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields required"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleCtrl.text.trim(),
      description: descCtrl.text.trim(),
      status: "Pending",
      createdAt: DateTime.now(),
    );

    dummyTasks.insert(0, newTask);

    Navigator.pop(context, true); // return success
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Premium light background
      appBar: AppBar(
        title: const Text("Create New Task",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image or Icon
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.assignment_add, size: 40, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 30),

            const Text("Task Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 15),

            // Task Title Input
            _buildInputContainer(
              child: TextField(
                controller: titleCtrl,
                style: const TextStyle(fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  labelText: "Task Title",
                  prefixIcon: Icon(Icons.title_rounded, color: Colors.blue),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Description Input
            _buildInputContainer(
              child: TextField(
                controller: descCtrl,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "What needs to be done?",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 80), // Aligns icon to top
                    child: Icon(Icons.description_outlined, color: Colors.blue),
                  ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Save Task Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  shadowColor: Colors.blue.withOpacity(0.4),
                ),
                onPressed: saveTask,
                child: const Text(
                  "SAVE TASK",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Common Input Decorator
  Widget _buildInputContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: child,
      ),
    );
  }
}