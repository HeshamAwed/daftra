import 'package:daftra/domain/app_database/app_database.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<AppDatabase> get appDatabase =>
      $FloorAppDatabase.databaseBuilder('daftra.db').build();
}
