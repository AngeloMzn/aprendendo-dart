import 'package:uuid/uuid.dart';

class User {
  String? id;
  String name;
  String email;
  String password;
  String role;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.role,
      this.id}) {
    if (id == null || id!.isEmpty) {
      id = Uuid().v4();
    }
  }
}
