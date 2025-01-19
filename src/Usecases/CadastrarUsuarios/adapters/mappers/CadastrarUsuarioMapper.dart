import 'dart:convert';

import '../../../../domain/entities/User.dart';
import '../DTOs/CadastrarUsuarioDTO.dart';

class CadastrarUsuarioMapper {
  static Future<UserDTO> toUserDTO(String data) async {
    final decodedData = jsonDecode(data);
    return UserDTO(decodedData['name'], decodedData['email'],
        decodedData['password'], decodedData['role']);
  }

  static User toDomain(UserDTO userDTO) {
    return User(
        name: userDTO.name,
        email: userDTO.email,
        password: userDTO.password,
        role: userDTO.role);
  }

  static toJson(User user) {
    return {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'role': user.role,
    };
  }
}
