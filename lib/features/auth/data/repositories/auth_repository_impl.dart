import 'dart:developer';

import 'package:comunity_apps/core/error/failure.dart';

import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/data/datasources/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/remote_datasource.dart';
import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/data/models/token_model.dart';
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
  Future<Either<Failure, LoginResponse>> login(AuthModel data) async {
    bool connected = await connectivity.isConnected();

    // TODO: implement login

    try {
      if (!connected) {
        // TokenModel result = await authLocalDataSource.login();

        return Left(Failure());
      } else {
        TokenModel result = await authRemoteDataSource.auth(data);
        // print('result' + result.toString());
        print('token is' + result.token);
        storageService.write("token", result.token);

        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }

    // throw UnimplementedError();
  }

  @override
  Future<Either<String, Failure>> register(RegisterUser data) async {
    bool connected = await connectivity.isConnected();
    try {
      if (!connected) {
        // String result = await authLocalDataSource.register();
        // storageService.write("register", result);
        // return Left(result);
        return Right(Failure());
      } else {
        String result = await authRemoteDataSource.register(data);
        return Left(result);
      }
    } catch (e) {
      return Right(Failure());
    }
  }
}
