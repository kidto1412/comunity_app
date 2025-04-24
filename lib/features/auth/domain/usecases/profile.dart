import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';
import 'package:comunity_apps/features/auth/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileUseCase {
  final UserRepository userRepository;
  const ProfileUseCase(this.userRepository);

  Future<Either<Failure, User>> execute() async {
    return await userRepository.getProfile();
  }
}
