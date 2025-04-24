import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  // login
  Future<Either<Failure, LoginResponse>> login(AuthModel data);
}
