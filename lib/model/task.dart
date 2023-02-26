class Task {
  int? id;
  String? title;
  String? studentId;
  String? createdAt;
  String? updatedAt;
  bool? isDone;

  Task();

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    studentId = json['student_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDone = json['is_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['student_id'] = this.studentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_done'] = this.isDone;
    return data;
  }
}
