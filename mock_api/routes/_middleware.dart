import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_todos_data_source/in_memory_todos_data_source.dart';
import 'package:in_memory_users_data_source/in_memory_users_data_source.dart';

final _dataSource = InMemoryTodosDataSource();
// ignore: non_constant_identifier_names
final _dataSource_users = InMemoryUsersDataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<TodosDataSource>((_) => _dataSource))
      .use(provider<UsersDataSource>((_) => _dataSource_users));
}
