import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class Register {
  final AuthRepository authRepository;

  const Register(this.authRepository);

  Future<Either<String, Failure>> execute(RegisterUser data) async {
    return await authRepository.register(data);
  }
}
