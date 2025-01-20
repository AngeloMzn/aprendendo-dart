import '../../Infra/DAO/UserDAO.dart';
import '../../Infra/Repository/UserRepository.dart';
import 'CadastrarUsuarioController.dart';
import 'CadastrarUsuarioUseCase.dart';

var userDao = UserDAO();
var userRepository = UserRepository(userDao);
var cadastrarUsuarioUseCase = CadastrarUsuarioUseCase(userRepository);
var cadastrarUsuarioController =
    CadastrarUsuarioController(cadastrarUsuarioUseCase);
