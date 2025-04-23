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
  List<Object> get props => [username, name, dateOfBirth, photoProfile ?? ''];
}
