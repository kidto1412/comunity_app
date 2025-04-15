import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  // get profile
  Future<Either<ResponseProfile, Failure>> getProfile();
}
