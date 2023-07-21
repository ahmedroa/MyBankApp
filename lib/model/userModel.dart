// ignore_for_file: file_names

class UserModel {
  UserModel({
    required this.uId,
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });

  late final String uId;
  late final String name;
  late final String password;
  late final String email;
  late final String phone;

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'] ?? '';
    name = json['name'] ?? '';
    password = json['password'] ?? '';
    email = json['email'] ?? '';
    email = json['phone'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'name': name,
      'password': password,
      'email': email,
      'phone': phone,
    };
  }
}
