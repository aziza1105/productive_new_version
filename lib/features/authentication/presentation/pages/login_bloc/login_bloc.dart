import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final mailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  LoginBloc() : super(LoginState()) {
    on<ObscurePasswordEvent>(_onObscurePassword);
  }

  void _onObscurePassword(
      ObscurePasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isObscure: !state.isObscure));
  }
}
