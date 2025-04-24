import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final int? id;
  final String username;
  final String name;
  final String dateOfBirth;
  final String? photoProfile;
  final String password;

  const Register(
      {this.id,
      required this.name,
      required this.dateOfBirth,
      required this.password,
      required this.username,
      this.photoProfile});

  @override
  List<Object> get props =>
      [id ?? 0, username, password, name, dateOfBirth, photoProfile ?? ''];
}

class RegisterResponse extends Equatable {
  final String data;
  const RegisterResponse({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
