import '../../models/task_model.dart';

List<TaskModel> dummyTasks = [
  TaskModel(
    id: "1",
    title: "Design Landing Page",
    description: "Create UI for landing page with Figma reference",
    status: "Pending",
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  TaskModel(
    id: "2",
    title: "Fix Login Bug",
    description: "Resolve email validation issue on login screen",
    status: "In Progress",
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  TaskModel(
    id: "3",
    title: "API Integration",
    description: "Integrate task list API with authentication token",
    status: "Completed",
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),
];
