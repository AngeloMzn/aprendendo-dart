import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../../Usecases/CadastrarUsuarios/DependencyInjector.dart' as di;

void initializeUserRoutes(Router app) {
  app.get('/users', (Request req) {
    return Response.ok(jsonEncode('Lista de usuários'));
  });

  app.get('/users/<id>', (Request req, Response res, String id) {
    return Response.ok('Detalhes do usuário $id');
  });

  app.post("/user/cadastrar", (Request req) async {
    final result = await di.cadastrarUsuarioController.handle(req);
    return Response.ok(result);
  });
}
