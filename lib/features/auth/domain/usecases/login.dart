import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository authRepository;
  const LoginUseCase(this.authRepository);

  Future<Either<Failure, LoginResponse>> execute(AuthModel data) async {
    return await authRepository.login(data);
  }
}
