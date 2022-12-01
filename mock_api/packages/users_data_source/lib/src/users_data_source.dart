import 'package:users_data_source/users_data_source.dart';

/// An interface for a Userss data source.
/// A Userss data source supports basic C.R.U.D operations.
/// * C - Create
/// * R - Read
/// * U - Update
/// * D - Delete
abstract class UsersDataSource {
  /// Create and return the newly created Users.
  Future<Users> create(Users users);

  /// Return all Userss.
  Future<List<Users>> readAll();

  /// Return a Users with the provided [id] if one exists.
  Future<Users?> read(String id);

  /// Update the Users with the provided [id] to match [Users] and
  /// return the updated Users.
  Future<Users> update(String id, Users users);

  /// Delete the Users with the provided [id] if one exists.
  Future<void> delete(String id);
}
