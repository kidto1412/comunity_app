import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String name;
  final String username;
  final String dateOfBirth;
  final String? photoProfile;

  const User(
      {this.id,
      required this.name,
      required this.dateOfBirth,
      required this.username,
      this.photoProfile});

  @override
  List<Object> get props =>
      [id ?? 0, username, name, dateOfBirth, photoProfile ?? ''];
}

class ResponseProfile extends User {
  const ResponseProfile(
      {required super.name,
      required super.dateOfBirth,
      required super.username,
      required super.photoProfile});
  @override
  List<Object> get props => [username, name, dateOfBirth, photoProfile ?? ''];
}
