import 'package:comunity_apps/core/error/failure.dart';
import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/data/datasources/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/remote_datasource.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
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
  Future<Either<ResponseProfile, Failure>> getProfile() async {
    try {
      bool connected = await connectivity.isConnected();
      if (!connected) {
        ResponseProfile result = await authRemoteDataSource.getProfile();
        storageService.write("profile", result);
        return Left(result);
      } else {
        ResponseProfile result = await authLocalDataSource.getProfile();
        return Left(result);
      }
    } catch (e) {
      return Right(Failure());
    }
  }
}
