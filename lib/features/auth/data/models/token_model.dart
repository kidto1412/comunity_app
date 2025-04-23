import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

class TokenModel extends LoginResponse {
  const TokenModel({required super.token});

  factory TokenModel.formJson(Map<String, dynamic> json) {
    print(json['token']);
    return TokenModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {token: token};
  }
}
