class TaskModel {
  String id;
  int date;
  String title;
  String subTitle;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.subTitle,
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        title: json['title'],
        subTitle: json['subTitle'],
        date: json['date'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'date': date,
      'isDone': isDone,
    };
  }
}
