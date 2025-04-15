import 'package:comunity_apps/core/local/local_client.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

abstract class AuthLocalDataSource {
  Future<LoginResponse> login();
  Future<ResponseProfile> getProfile();
}

class AuthRemoteImplRemoteDataSource extends AuthLocalDataSource {
  final LocalClient localClient;
  AuthRemoteImplRemoteDataSource(this.localClient);

  @override
  Future<LoginResponse> login() async {
    return localClient.read('token');
  }

  @override
  Future<ResponseProfile> getProfile() async {
    return localClient.read('profile');
  }
}
