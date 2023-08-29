import 'package:daftra/domain/app_database/app_database.dart';
import 'package:daftra/domain/enitities/user.dart';
import 'package:injectable/injectable.dart';

abstract class UserDataSource {
  Future<User?> findUser(String email, String password);

  Future<void> addNewUser(User user);

  Future<void> updateUser(User user);
}

@Singleton(as: UserDataSource)
class UserDataSourceImpl extends UserDataSource {
  AppDatabase appDatabase;

  UserDataSourceImpl(this.appDatabase);

  @override
  Future<void> addNewUser(User user) => appDatabase.userDao.insertUser(user);

  @override
  Future<User?> findUser(String email, String password) =>
      appDatabase.userDao.findUser(email, password);

  @override
  Future<void> updateUser(User user) => appDatabase.userDao.updateUser(user);
}
