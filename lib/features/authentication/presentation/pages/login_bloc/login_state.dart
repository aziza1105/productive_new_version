part of 'login_bloc.dart';

class LoginState {
  bool isObscure;

  LoginState({
    this.isObscure = false,
  });

  copyWith({
    bool? isObscure,
  }) {
    return LoginState(
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
