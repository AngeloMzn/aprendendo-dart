import '../entities/User.dart';

abstract class IUserRepository {
  Future<User> getUserById(String id);
  Future<User> createUser(User user);
}
