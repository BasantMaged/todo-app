class TaskModel {
  final int id;
  final String title;
  final String description;
  final String? createdAt;
  final String? imagePath;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
    this.imagePath,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? 0, // Default to 0 if null
      title: json['title'] ?? 'Untitled',
      description: json['description'] ?? '',
      createdAt: json['created_at'],
      imagePath: json['image_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "image_path": imagePath,
    };
  }
}
