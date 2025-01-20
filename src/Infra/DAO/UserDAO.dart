import 'package:aprendendo_dart/src/generated/prisma_client.dart'
    as prismaClient;

import '../../Domain/IDAO/IUserDAO.dart';
import '../../Domain/entities/User.dart';

class UserDAO implements IUserDAO {
  dynamic prisma;

  UserDAO() {
    prisma = prismaClient.PrismaClient();
  }

  @override
  Future<void> delete(String id) async {
    await prisma.user.delete(where: {'id': id});
  }

  @override
  Future<List<User>> findAll() async {
    final users = await prisma.user.findMany();
    return users
        .map((user) => User(
              id: user.id,
              name: user.name,
              email: user.email,
              password: user.password,
              role: user.role,
              createdAt: user.createdAt,
              updatedAt: user.updatedAt,
            ))
        .toList();
  }

  @override
  Future<User?> findById(String id) async {
    final user = await prisma.user.findUnique(where: {'id': id});
    if (user == null) return null;
    return User(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      role: user.role,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  @override
  Future<User> save(User user) async {
    final createdUser = await prisma.user.create(data: {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'role': user.role,
      'createdAt': user.createdAt,
      'updatedAt': user.updatedAt
    });
    return User(
      id: createdUser.id,
      name: createdUser.name,
      email: createdUser.email,
      password: createdUser.password,
      role: createdUser.role,
      createdAt: createdUser.createdAt,
      updatedAt: createdUser.updatedAt,
    );
  }

  @override
  Future<void> update(User user) async {
    await prisma.user.update(
      where: {'id': user.id},
      data: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'role': user.role,
        'createdAt': user.createdAt,
        'updatedAt': user.updatedAt,
      },
    );
  }
}
