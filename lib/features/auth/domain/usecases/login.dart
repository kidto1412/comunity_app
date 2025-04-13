import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository authRepository;
  const Login(this.authRepository);

  Future execute(Auth data) async {
    return await authRepository.login(data);
  }
}
