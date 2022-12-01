import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'users.g.dart';

@immutable
@JsonSerializable()
class Users extends Equatable {
  // ignore: public_member_api_docs
  Users({
    required this.id,
    this.token = '',
    required this.email,
    this.isAdmin = false,
    required this.password,
    required this.phoneNumber,
    this.profileUrl = '',
  }) : assert(id == null || id.isNotEmpty, 'id cannot be empty');

  final String? id;

  final String email;

  final String password;

  final String profileUrl;

  final int phoneNumber;

  final bool isAdmin;

  final String token;

  Users copyWith({
    String? id,
    String? email,
    String? password,
    String? profileUrl,
    int? phoneNumber,
    bool? isAdmin,
    String? token,
  }) {
    return Users(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      profileUrl: profileUrl ?? this.profileUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAdmin: isAdmin ?? this.isAdmin,
      token: token ?? this.token,
    );
  }

  static Users fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  @override
  List<Object?> get props =>
      [id, email, password, profileUrl, phoneNumber, isAdmin];
}
