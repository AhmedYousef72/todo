class UserModel {
  String id;
  String Username;
  String email;
  String phone;
  int age;

  UserModel({
    this.id = "",
    required this.Username,
    required this.email,
    required this.phone,
    required this.age,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        Username: json['Username'],
        email: json['email'],
        phone: json['phone'],
        age: json['age'],
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Username': Username,
      'email': email,
      'phone': phone,
      'age': age,
    };
  }
}
