import 'package:uuid/uuid.dart';

class User {
  String? id;
  String name;
  String email;
  String password;
  String role;
  String? createdAt;
  String? updatedAt;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.role,
      this.id,
      this.createdAt,
      this.updatedAt}) {
    if (id == null || id!.isEmpty) {
      id = Uuid().v4();
    }
  }
}
