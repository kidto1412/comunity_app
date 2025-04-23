import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {super.id,
      required super.username,
      required super.dateOfBirth,
      required super.name,
      super.photoProfile});

  factory UserModel.formJson(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'],
        name: json['name'],
        dateOfBirth: json['date_of_birth'],
        photoProfile: json['photoProfile'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "dateOfBirth": dateOfBirth,
      "name": name,
      "photoProfile": photoProfile
    };
  }
}
