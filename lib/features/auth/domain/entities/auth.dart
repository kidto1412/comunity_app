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
  List<Object?> get props => [token];
}

class RegisterUser extends Auth {
  final int? id;
  final String name;
  final String dateOfBirth;
  final String? photoProfile;

  const RegisterUser(
      {this.id,
      required this.name,
      required this.dateOfBirth,
      required super.password,
      required super.username,
      this.photoProfile});

  @override
  List<Object> get props =>
      [username, password ?? '', name, dateOfBirth, photoProfile ?? ''];
}

class ResponseProfile extends RegisterUser {
  const ResponseProfile(
      {required super.name,
      required super.dateOfBirth,
      required super.username,
      required super.photoProfile})
      : super(password: null);
}

class Login extends Auth {
  const Login({required super.username, required super.password});

  @override
  List<Object> get props => [username, password ?? ''];
}
