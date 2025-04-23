import 'package:comunity_apps/constant/constant.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/data/models/token_model.dart';
import 'package:comunity_apps/features/auth/data/models/user_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> auth(AuthModel data);
  Future<String> register(RegisterUser data);
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final NetworkClient client;
  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<TokenModel> auth(AuthModel request) async {
    var response = await client.post(Constant.baseUrl + "/user/login",
        data: request.toJson());
    final token = response.data['data']; // ambil token dari 'data'
    print(token);
    return TokenModel.formJson(token);
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
  Future<UserModel> getProfile() async {
    try {
      var response = await client.get(Constant.baseUrl + '/user/profile');
      final data = response.data['data'];
      print("user : " + data.toString());
      return UserModel.formJson(data);
    } catch (e) {
      print('Parsing error: $e');
      rethrow;
    }
    // return UserModel.formJson(body);
  }
}
