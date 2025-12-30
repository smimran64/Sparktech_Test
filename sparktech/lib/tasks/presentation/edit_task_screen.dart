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
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Prothom bar initialize korar jonno condition
    if (!isInitialized) {
      task = ModalRoute.of(context)!.settings.arguments as TaskModel;
      titleCtrl = TextEditingController(text: task.title);
      descCtrl = TextEditingController(text: task.description);
      isInitialized = true;
    }
  }

  // --- APNAR ORIGINAL LOGIC ---
  void updateTask() {
    if (titleCtrl.text.isEmpty || descCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fields cannot be empty"), behavior: SnackBarBehavior.floating),
      );
      return;
    }

    task.title = titleCtrl.text.trim();
    task.description = descCtrl.text.trim();

    Navigator.pop(context); // back to details
    Navigator.pop(context); // back to home
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Task Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Illustration Icon
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.edit_note_rounded, size: 60, color: Colors.orange.shade800),
              ),
            ),
            const SizedBox(height: 40),

            const Text("Modify Task Info",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
            const SizedBox(height: 20),

            // Title Field
            _buildEditInput(
              controller: titleCtrl,
              label: "Task Title",
              icon: Icons.title_rounded,
            ),

            const SizedBox(height: 25),

            // Description Field
            _buildEditInput(
              controller: descCtrl,
              label: "Task Description",
              icon: Icons.description_outlined,
              maxLines: 5,
            ),

            const SizedBox(height: 40),

            // Update Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800, // Edit er jonno orange/amber use kora valo
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  shadowColor: Colors.orange.withOpacity(0.3),
                ),
                onPressed: updateTask,
                child: const Text(
                  "UPDATE CHANGES",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Discard Changes", style: TextStyle(color: Colors.redAccent)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Stylish Input Builder
  Widget _buildEditInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.orange.shade700),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}