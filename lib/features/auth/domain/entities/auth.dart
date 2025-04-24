import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String username;
  final String? password;
  const Auth({
    required this.username,
    this.password,
  });

  @override
  List<Object> get props => [username, password ?? ''];
}

class LoginResponse extends Equatable {
  final String token;
  const LoginResponse({required this.token});

  @override
  List<Object> get props => [token];
}

class Login extends Auth {
  const Login({required super.username, required super.password});

  @override
  List<Object> get props => [username, password ?? ''];
}
