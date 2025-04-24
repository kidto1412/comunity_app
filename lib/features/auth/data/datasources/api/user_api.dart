import 'package:comunity_apps/constant/constant.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:comunity_apps/features/auth/data/models/register_model.dart';
import 'package:comunity_apps/features/auth/data/models/user_model.dart';

abstract class UserAPI {
  Future<String> register(RegisterModel data);
  Future<UserModel> getProfile();
}

class UserAPIImpl extends UserAPI {
  final NetworkClient client;
  UserAPIImpl(this.client);
  @override
  Future<String> register(RegisterModel request) async {
    // TODO: implement register
    try {
      var response = await client
          .post(Constant.baseUrl + "/user/register", data: {request});
      final dataBody = response.data['data'];
      return dataBody;
    } catch (e) {
      print('Parsing error: $e');
      rethrow;
    }
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
