import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.username,
    this.isAdmin = false,
  });

  String username;
  bool isAdmin;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
  };
}