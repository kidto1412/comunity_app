import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class Login {
  final AuthRepository authRepository;
  const Login(this.authRepository);

  Future<Either<LoginResponse, Failure>> execute(Auth data) async {
    return await authRepository.login(data);
  }
}
