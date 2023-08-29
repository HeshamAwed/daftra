import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String email;
  final String password;
  final int loginTimes;

  User(this.id, this.email, this.password, this.loginTimes);

  User copyWith({int? id, String? email, String? password, int? loginTimes}) =>
      User(
        id ?? this.id,
        email ?? this.email,
        password ?? this.password,
        loginTimes ?? this.loginTimes,
      );
}
