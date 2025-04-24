import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/data/models/register_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  // get profile
  Future<Either<Failure, User>> getProfile();
  // register
  Future<Either<Failure, String>> register(RegisterModel data);
}
