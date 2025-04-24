import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/data/datasources/api/user_api.dart';
import 'package:comunity_apps/features/auth/data/datasources/local/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/api/auth_api.dart';
import 'package:comunity_apps/features/auth/data/models/register_model.dart';
import 'package:comunity_apps/features/auth/data/models/user_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/register.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';
import 'package:comunity_apps/features/auth/domain/repositories/user_repository.dart';
import 'package:comunity_apps/utils/conectivity_service.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final UserAPI userAPI;
  final AuthLocalDataSource authLocalDataSource;
  final StorageService storageService;
  final connectivity = ConnectivityServiceImpl();

  UserRepositoryImpl(
      {required this.authLocalDataSource,
      required this.userAPI,
      required this.storageService});

  @override
  Future<Either<Failure, User>> getProfile() async {
    try {
      bool connected = await connectivity.isConnected();
      if (!connected) {
        // UserModel result = await userAPI.getProfile();
        // storageService.write("profile", result);
        return Left(Failure());
      } else {
        UserModel result = await userAPI.getProfile();
        storageService.write("profile", result.toJson());

        print(result);

        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }
  }

  Future<Either<Failure, String>> register(RegisterModel request) async {
    try {
      bool connected = await connectivity.isConnected();
      if (!connected) {
        // UserModel result = await userAPI.getProfile();
        // storageService.write("profile", result);
        return Left(Failure());
      } else {
        String result = await userAPI.register(request);
        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }
  }
}
