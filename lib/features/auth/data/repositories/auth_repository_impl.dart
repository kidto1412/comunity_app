import 'dart:developer';

import 'package:comunity_apps/core/error/failure.dart';

import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/data/datasources/local/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/api/auth_api.dart';
import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/data/models/token_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';
import 'package:comunity_apps/utils/conectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthAPI authAPI;
  final connectivity = ConnectivityServiceImpl();
  final StorageService storageService;

  AuthRepositoryImpl(
      {required this.authLocalDataSource,
      required this.authAPI,
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
        TokenModel result = await authAPI.auth(data);
        // print('result' + result.toString());
        print('token is' + result.token);
        storageService.write("token", result.token);
        var myToken = storageService.read("token");
        print("may token" + myToken);
        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }

    // throw UnimplementedError();
  }
}
