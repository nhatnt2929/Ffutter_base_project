import 'package:equatable/equatable.dart';
import 'package:pes/providers/model/user_model.dart';

abstract class LoginState extends Equatable {
  final String email;
  final String password;

  const LoginState({this.email = '', this.password = ''});

  @override
  List<Object> get props => [email, password];

  bool get isValidForm {
    return isValidEmail && isValidPassword;
  }

  bool get isValidEmail {
    return email.length > 0;
  }

  bool get isValidPassword {
    return password.length > 0;
  }
}

class LoginInitial extends LoginState {}

class LoginChangedState extends LoginState {
  const LoginChangedState({
    required String email,
    required String password,
  }) : super(email: email, password: password);
}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final User model;
  const LoginStateSuccess(this.model);

  @override
  List<Object> get props => [model];
}

class LoginStateError extends LoginState {
  final String error;
  const LoginStateError(this.error);

  @override
  List<Object> get props => [error];
}
