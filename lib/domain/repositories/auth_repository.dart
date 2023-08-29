import 'package:daftra/domain/data_sources/user_data_source.dart';
import 'package:daftra/domain/enitities/user.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<User?> findUser(String email, String password);

  Future<void> addNewUser(User user);

  Future<void> updateUser(User user);
}

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  UserDataSource userDataSource;

  AuthRepositoryImpl(this.userDataSource);

  @override
  Future<void> addNewUser(User user) => userDataSource.addNewUser(user);

  @override
  Future<User?> findUser(String email, String password) =>
      userDataSource.findUser(email, password);

  @override
  Future<void> updateUser(User user) => userDataSource.updateUser(user);
}
