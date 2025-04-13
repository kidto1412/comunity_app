import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String username;
  final String password;
  const Auth({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class RegisterUser extends Auth {
  final int? id;
  final String name;
  final String date_of_birth;

  const RegisterUser({
    this.id,
    required this.name,
    required this.date_of_birth,
    required String password,
    required String username,
  }) : super(username: username, password: password);

  @override
  List<Object> get props => [username, password, name, date_of_birth];
}

class Login extends Auth {
  const Login({required super.username, required super.password});
  List<Object> get props => [username, password];
}
