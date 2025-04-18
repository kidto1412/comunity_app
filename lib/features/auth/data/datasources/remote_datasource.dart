import 'package:comunity_apps/constant/constant.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/data/models/token_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> auth(AuthModel data);
  Future<String> register(RegisterUser data);
  Future<ResponseProfile> getProfile();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final NetworkClient client;
  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<LoginResponse> auth(AuthModel request) async {
    var response = await client.post(Constant.baseUrl + "/user/login",
        data: request.toJson());
    final dataBody = response.data['data']; // ambil token dari 'data'
    return TokenModel.formJson(dataBody);
  }

  @override
  Future<String> register(RegisterUser request) async {
    var response =
        await client.post(Constant.baseUrl + "/user/register", data: {request});
    final dataBody = response.data['data'];
    return dataBody;
    // throw UnimplementedError();
  }

  @override
  Future<ResponseProfile> getProfile() async {
    var response = await client.get('/user/profile');
    final body = response.data['data'];
    return body;
  }
}
