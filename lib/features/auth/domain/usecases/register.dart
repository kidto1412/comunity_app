import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/data/models/register_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';
import 'package:comunity_apps/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class Register {
  final UserRepository userRepository;

  const Register(this.userRepository);

  Future<Either<Failure, String>> execute(RegisterModel data) async {
    return await userRepository.register(data);
  }
}
