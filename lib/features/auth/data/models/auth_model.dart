import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({required super.username, super.password});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
