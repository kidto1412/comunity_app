import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/data/datasources/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/remote_datasource.dart';
import 'package:comunity_apps/features/auth/data/models/user_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';
import 'package:comunity_apps/features/auth/domain/repositories/profile_repository.dart';
import 'package:comunity_apps/utils/conectivity_service.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final StorageService storageService;
  final connectivity = ConnectivityServiceImpl();

  ProfileRepositoryImpl(
      {required this.authLocalDataSource,
      required this.authRemoteDataSource,
      required this.storageService});

  @override
  Future<Either<Failure, User>> getProfile() async {
    try {
      bool connected = await connectivity.isConnected();
      if (!connected) {
        // UserModel result = await authRemoteDataSource.getProfile();
        // storageService.write("profile", result);
        return Left(Failure());
      } else {
        UserModel result = await authRemoteDataSource.getProfile();
        storageService.write("profile", result.toJson());

        print(result);

        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }
  }
}
