class TaskModel {
  String id;
  int date;
  String title;
  String subTitle;
  bool isDone;
  String userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.subTitle,
    required this.date,
    required this.userId,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        title: json['title'],
        subTitle: json['subTitle'],
        date: json['date'],
        userId: json['userId'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'date': date,
      'userId': userId,
      'isDone': isDone,
    };
  }
}
