import 'package:daftra/domain/enitities/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE email = :email AND password= :password')
  Future<User?> findUser(
    String email,
    String password,
  );

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(User user);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(User user);
}
