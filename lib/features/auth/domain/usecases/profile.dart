import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class Profile {
  final ProfileRepository profileRepository;
  const Profile(this.profileRepository);

  Future<Either<ResponseProfile, Failure>> execute() async {
    return await profileRepository.getProfile();
  }
}
