import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_users_data_source/in_memory_users_data_source.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  final dataSource = context.read<UsersDataSource>();
  final users = await dataSource.read(id);

  if (users == null) {
    return Response(statusCode: HttpStatus.notFound, body: 'Not found Users');
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, users);
    case HttpMethod.put:
      return _put(context, id, users);
    case HttpMethod.delete:
      return _delete(context, id);
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, Users todo) async {
  return Response.json(body: todo);
}

Future<Response> _put(RequestContext context, String id, Users users) async {
  final dataSource = context.read<UsersDataSource>();
  final updatedUser = Users.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );
  final newUser = await dataSource.update(
    id,
    users.copyWith(
        email: updatedUser.email,
        isAdmin: updatedUser.isAdmin,
        profileUrl: updatedUser.profileUrl,
        password: updatedUser.password,
        phoneNumber: updatedUser.phoneNumber),
  );

  return Response.json(body: newUser);
}

Future<Response> _delete(RequestContext context, String id) async {
  final dataSource = context.read<UsersDataSource>();
  await dataSource.delete(id);
  return Response(statusCode: HttpStatus.noContent);
}
