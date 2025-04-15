import 'package:comunity_apps/constant/constant.dart';
import 'package:comunity_apps/features/auth/data/models/token_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> auth(Auth data);
  Future<String> register(RegisterUser data);
}

class AuthRemoteImplRemoteDataSource extends AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteImplRemoteDataSource(this.dio);

  @override
  Future<LoginResponse> auth(Auth request) async {
    var response =
        await dio.post(Constant.baseUrl + "/user/login", data: {request});
    final dataBody = response.data['data']; // ambil token dari 'data'
    return TokenModel.formJson(dataBody);
  }

  @override
  Future<String> register(RegisterUser request) async {
    var response =
        await dio.post(Constant.baseUrl + "/user/register", data: {request});
    final dataBody = response.data['data'];
    return dataBody;
    // throw UnimplementedError();
  }
}
