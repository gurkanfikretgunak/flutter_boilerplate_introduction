import 'package:users_data_source/users_data_source.dart';
import 'package:uuid/uuid.dart';

class InMemoryUsersDataSource implements UsersDataSource {
  final _cache = <String, Users>{};

  @override
  Future<Users> create(Users users) async {
    final id = const Uuid().v4();
    final createdUsers = users.copyWith(id: id);
    _cache[id] = createdUsers;
    return createdUsers;
  }

  @override
  Future<List<Users>> readAll() async => _cache.values.toList();

  @override
  Future<Users?> read(String id) async => _cache[id];

  @override
  Future<Users> update(String id, Users users) async {
    return _cache.update(id, (value) => users);
  }

  @override
  Future<void> delete(String id) async => _cache.remove(id);
}
