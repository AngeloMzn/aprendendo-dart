import '../../domain/IRespository/IUserRepository.dart';
import '../../Domain/entities/User.dart';
import '../DAO/UserDAO.dart';

class UserRepository implements IUserRepository {
  UserDAO userDAO = UserDAO();

  UserRepository(UserDAO userDAO);

  @override
  Future<void> delete(String id) {
    return userDAO.delete(id);
  }

  @override
  Future<List<User>> findAll() {
    return userDAO.findAll();
  }

  @override
  Future<User?> findById(String id) {
    return userDAO.findById(id);
  }

  @override
  Future<User> save(User user) {
    return userDAO.save(user);
  }

  @override
  Future<void> update(User user) {
    return userDAO.update(user);
  }
}
