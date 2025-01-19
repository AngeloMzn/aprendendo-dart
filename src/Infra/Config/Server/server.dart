import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import '../api/routes.dart' as api;

void main() async {
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(api.initializeApiRoutes().call);

  var server = await shelf_io.serve(handler, 'localhost', 3001);

  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}
