// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../domain/app_database/app_database.dart' as _i3;
import '../domain/data_sources/user_data_source.dart' as _i6;
import '../domain/repositories/auth_repository.dart' as _i7;
import '../presentation/features/auth/auth_bloc/auth_bloc.dart' as _i4;
import 'register_module.dart' as _i8;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.AppDatabase>(
    () => registerModule.appDatabase,
    preResolve: true,
  );
  gh.factory<_i4.AuthBloc>(() => _i4.AuthBloc());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i6.UserDataSource>(
      _i6.UserDataSourceImpl(gh<_i3.AppDatabase>()));
  gh.singleton<_i7.AuthRepository>(
      _i7.AuthRepositoryImpl(gh<_i6.UserDataSource>()));
  return getIt;
}

class _$RegisterModule extends _i8.RegisterModule {}
