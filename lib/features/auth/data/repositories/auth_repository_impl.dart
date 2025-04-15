import 'package:comunity_apps/core/error/failure.dart';

import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/data/datasources/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/remote_datasource.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';
import 'package:comunity_apps/utils/conectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;
  final connectivity = ConnectivityServiceImpl();
  final StorageService storageService;

  AuthRepositoryImpl(
      {required this.authLocalDataSource,
      required this.authRemoteDataSource,
      required this.storageService});

  @override
  Future<Either<LoginResponse, Failure>> login(Auth data) async {
    bool connected = await connectivity.isConnected();

    // TODO: implement login

    try {
      if (!connected) {
        LoginResponse result = await authLocalDataSource.login();
        storageService.write("token", result);
        return Left(result);
      } else {
        LoginResponse result = await authRemoteDataSource.auth(data);
        return Left(result);
      }
    } catch (e) {
      return Right(Failure());
    }

    // throw UnimplementedError();
  }

  @override
  Future<Either<String, Failure>> register(RegisterUser data) async {
    bool connected = await connectivity.isConnected();
    try {
      if (!connected) {
        String result = await authLocalDataSource.register();
        storageService.write("register", result);
        return Left(result);
      } else {
        String result = await authRemoteDataSource.register(data);
        return Left(result);
      }
    } catch (e) {
      return Right(Failure());
    }
  }
}
