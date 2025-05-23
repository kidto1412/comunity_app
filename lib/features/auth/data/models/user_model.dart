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
        id: json['id'] ?? 0,
        username: json['username'],
        name: json['name'],
        dateOfBirth: json['date_of_birth'],
        photoProfile: json['photo_profile'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "dateOfBirth": dateOfBirth,
      "name": name,
      "photo_profile": photoProfile
    };
  }
}
