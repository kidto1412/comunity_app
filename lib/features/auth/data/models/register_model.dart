import '../../domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel(
      {required super.name,
      required super.dateOfBirth,
      required super.password,
      required super.username,
      super.photoProfile});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "name": name,
      "date_of_birth": dateOfBirth,
      "photo_profike": photoProfile
    };
  }
}
