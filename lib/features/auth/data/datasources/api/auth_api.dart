import 'package:comunity_apps/constant/constant.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/data/models/token_model.dart';
import 'package:comunity_apps/features/auth/data/models/user_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

abstract class AuthAPI {
  Future<TokenModel> auth(AuthModel data);
}

class AuthAPIImpl extends AuthAPI {
  final NetworkClient client;
  AuthAPIImpl(this.client);

  @override
  Future<TokenModel> auth(AuthModel request) async {
    var response = await client.post(Constant.baseUrl + "/user/login",
        data: request.toJson());
    final token = response.data['data']; // ambil token dari 'data'
    print(token);
    return TokenModel.formJson(token);
  }
}
