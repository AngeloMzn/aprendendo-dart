import 'package:shelf_router/shelf_router.dart';
import 'user_routes.dart' as user_routes;

Router initializeApiRoutes() {
  final app = Router();
  user_routes.initializeUserRoutes(app);
  return app;
}
