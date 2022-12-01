// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as String?,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as int,
      profileUrl: json['profileUrl'] as String? ?? '',
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'profileUrl': instance.profileUrl,
      'phoneNumber': instance.phoneNumber,
      'isAdmin': instance.isAdmin,
    };
