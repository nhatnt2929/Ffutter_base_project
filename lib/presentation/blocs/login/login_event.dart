import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginChangedEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginChangedEvent({this.email = '', this.password = ''}) : super();

  @override
  List<Object> get props => [email, password];
}

class LoginSignInButton extends LoginEvent {
  final String email;
  final String password;
  const LoginSignInButton(this.email, this.password) : super();

  @override
  List<Object> get props => [email, password];
}
