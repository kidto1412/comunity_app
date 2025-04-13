import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';

class Register {
  final AuthRepository authRepository;

  const Register(this.authRepository);

  Future execute(RegisterUser data) async {
    return await authRepository.register(data);
  }
}
