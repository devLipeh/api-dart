import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Routes {
  Handler get handler {
    final routes = Router();

    routes.get(
      "/",
      (Request request) {
        return Response(
          200,
          body: "Hello World",
        );
      },
    );

    routes.get(
      "/hero",
      (Request request) {
        String? name = request.url.queryParameters["name"];

        return Response.ok(
          "Hello: ${name ?? "Annonymous"}",
        );
      },
    );

    routes.post(
      "/user",
      (Request request) async {
        var result = await request.readAsString();
        Map json = jsonDecode(result);

        var user = json["user"];
        var password = json["password"];

        if (user == "admin" && password == "25487896") {
          return Response.ok("Acesso permitido!");
        }

        return Response.ok(
          "Acesso negado!",
        );
      },
    );

    return routes;
  }
}
