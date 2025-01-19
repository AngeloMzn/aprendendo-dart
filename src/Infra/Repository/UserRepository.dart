import '../../domain/IRespository/IUserRepository.dart';
import '../../domain/entities/User.dart';

class UserRepository implements IUserRepository {
  @override
  Future<User> createUser(User user) {
    throw UnimplementedError("chegou aqui !");
  }

  @override
  Future<User> getUserById(String id) {
    throw UnimplementedError("chegou aqui !");
  }
}
