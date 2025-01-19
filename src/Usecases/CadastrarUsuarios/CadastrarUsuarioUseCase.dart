import '../../Infra/Repository/UserRepository.dart';
import 'adapters/DTOs/CadastrarUsuarioDTO.dart';
import 'adapters/mappers/CadastrarUsuarioMapper.dart';

class CadastrarUsuarioUseCase {
  final UserRepository? _userRepository;

  CadastrarUsuarioUseCase(this._userRepository);

  Future<dynamic> execute(UserDTO userDTO) async {
    var user = CadastrarUsuarioMapper.toDomain(userDTO);
    return await _userRepository!.createUser(user);
  }
}
