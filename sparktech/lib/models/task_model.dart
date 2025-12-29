class TaskModel {
  String id;
  String title;
  String description;
  String status;
  DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.status = "Pending",
    required this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['_id'] ?? json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'] ?? "Pending",
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "status": status,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
