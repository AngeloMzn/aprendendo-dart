import 'dart:io';
import 'package:aprendendo_dart/src/generated/prisma_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import '../api/routes.dart' as api;

Future<void> main() async {
  final prisma = PrismaClient();
  final logFile = File('logs.txt');

  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(api.initializeApiRoutes().call);

  try {
    var server = await shelf_io.serve(handler, 'localhost', 3001);

    server.autoCompress = true;

    print('Serving at http://${server.address.host}:${server.port}');
    await writeLog(logFile,
        'Server started at http://${server.address.host}:${server.port}');

    await prisma.$disconnect();
  } catch (e) {
    print('Error: $e');
    await writeLog(logFile, 'Error: $e');
    await prisma.$disconnect();
  }
}

Future<void> logPrismaQuery(
    File logFile, Future<void> Function() prismaOperation) async {
  final stopwatch = Stopwatch()..start();
  try {
    print('Executing Prisma query...');
    await writeLog(logFile, 'Executing Prisma query...');
    await prismaOperation();
    print('Prisma query executed successfully.');
    await writeLog(logFile, 'Prisma query executed successfully.');
  } catch (e) {
    print('Error during Prisma query: $e');
    await writeLog(logFile, 'Error during Prisma query: $e');
  } finally {
    print('Query took ${stopwatch.elapsedMilliseconds} ms');
    await writeLog(logFile, 'Query took ${stopwatch.elapsedMilliseconds} ms');
    stopwatch.stop();
  }
}

Future<void> writeLog(File logFile, String message) async {
  final timestamp = DateTime.now().toIso8601String();
  final logMessage = '[$timestamp] $message\n';
  await logFile.writeAsString(logMessage, mode: FileMode.append, flush: true);
}
