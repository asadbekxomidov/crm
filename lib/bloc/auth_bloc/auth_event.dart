import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class LogoutEvent extends AuthenticationEvent {}

class RegisterUserEvent extends AuthenticationEvent {
  final String name;
  final String phone;
  final String password;
  final String passwordConfirmation;

  RegisterUserEvent({
    required this.name,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object> get props => [name, phone, password, passwordConfirmation];
}

class LoginUserEvent extends AuthenticationEvent {
  final String phone;
  final String password;

  LoginUserEvent({required this.phone, required this.password});
}
