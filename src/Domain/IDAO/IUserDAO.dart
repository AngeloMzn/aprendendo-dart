import '../entities/User.dart';

abstract class IUserDAO {
  Future<User> save(User user);
  Future<void> update(User user);
  Future<void> delete(String id);
  Future<User?> findById(String id);
  Future<List<User>> findAll();
}
