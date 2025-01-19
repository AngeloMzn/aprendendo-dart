import '../../Infra/Repository/UserRepository.dart';
import 'CadastrarUsuarioController.dart';
import 'CadastrarUsuarioUseCase.dart';

var userRepository = UserRepository();
var cadastrarUsuarioUseCase = CadastrarUsuarioUseCase(userRepository);
var cadastrarUsuarioController =
    CadastrarUsuarioController(cadastrarUsuarioUseCase);
