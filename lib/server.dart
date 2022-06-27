import 'package:api_rest/routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  var routes = Routes();

  var server = await shelf_io.serve(
    routes.handler,
    "localhost",
    8080,
  );

  print("Server is running in port ${server.port}...");
}
