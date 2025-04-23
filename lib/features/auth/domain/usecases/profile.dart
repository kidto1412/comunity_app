import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';
import 'package:comunity_apps/features/auth/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileUseCase {
  final ProfileRepository profileRepository;
  const ProfileUseCase(this.profileRepository);

  Future<Either<Failure, User>> execute() async {
    return await profileRepository.getProfile();
  }
}
