import 'dart:async';

import 'package:daftra/di/dependency_init.dart';
import 'package:daftra/domain/enitities/user.dart';
import 'package:daftra/domain/repositories/auth_repository.dart';
import 'package:daftra/presentation/Helpers/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_login);
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final emailIsValid = Validator.validateEmail(event.email);
    final passwordIsValid = Validator.validatePassword(event.password);

    if (emailIsValid && passwordIsValid) {
      final user = await _authRepository.findUser(event.email, event.password);
      late User newUser;
      if (user != null) {
        newUser = user.copyWith(loginTimes: (user.loginTimes + 1));
        await _authRepository.updateUser(newUser);
      } else {
        newUser = User(DateTime.now().millisecondsSinceEpoch, event.email,
            event.password, 1);
        await _authRepository.addNewUser(newUser);
      }
      emit(AuthLoginSuccess(newUser));
    } else {
      emit(const AuthLoginFailure());
    }
  }
}
