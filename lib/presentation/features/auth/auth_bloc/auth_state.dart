part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class AuthLoginSuccess extends AuthState {
  final User user;

  const AuthLoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthLoginFailure extends AuthState {
  const AuthLoginFailure();

  @override
  List<Object> get props => [];
}
