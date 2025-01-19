import 'package:shelf/shelf.dart';
import 'CadastrarUsuarioUseCase.dart';
import 'adapters/mappers/CadastrarUsuarioMapper.dart';

class CadastrarUsuarioController {
  final CadastrarUsuarioUseCase? _cadastrarUsuarioUseCase;

  CadastrarUsuarioController(this._cadastrarUsuarioUseCase);

  Future<dynamic> handle(Request req) async {
    var data = req.readAsString();
    var cadastrarUsuarioData = CadastrarUsuarioMapper.toUserDTO(data);
    return await _cadastrarUsuarioUseCase!.execute(await cadastrarUsuarioData);
  }
}
