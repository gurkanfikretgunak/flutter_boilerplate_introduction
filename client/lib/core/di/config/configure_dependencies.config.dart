// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:client/core/data/network/abstractions/todos_service.dart'
    as _i6;
import 'package:client/core/data/network/abstractions/users_service.dart'
    as _i8;
import 'package:client/core/data/network/services/todos/todo_api.dart' as _i7;
import 'package:client/core/data/network/services/users/user_api.dart' as _i9;
import 'package:client/core/di/config/app_config.dart' as _i4;
import 'package:client/core/di/config/raw_helper.dart' as _i3;
import 'package:client/core/di/config/register_module.dart' as _i10;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.singletonAsync<_i3.RawConfig>(
    () => registerModule.config(),
    preResolve: true,
  );
  gh.singleton<_i4.AppConfig>(_i4.AppConfig(get<_i3.RawConfig>()));
  gh.singleton<_i5.Dio>(registerModule.dio(get<_i4.AppConfig>()));
  gh.factory<_i6.TodosService>(() => _i7.RestTodoService(
        get<_i5.Dio>(),
        get<_i4.AppConfig>(),
      ));
  gh.factory<_i8.UserService>(() => _i9.RestUserService(
        get<_i5.Dio>(),
        get<_i4.AppConfig>(),
      ));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
