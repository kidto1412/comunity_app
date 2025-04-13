import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

abstract class AuthRepository {
  // register
  Future register(RegisterUser data);

  // login
  Future login(Auth data);
}
