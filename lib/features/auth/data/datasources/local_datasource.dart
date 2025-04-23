import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/data/models/token_model.dart';
import 'package:comunity_apps/features/auth/data/models/user_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

abstract class AuthLocalDataSource {
  Future<TokenModel> login();
  Future<UserModel> getProfile();
  // Future<String> register();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final StorageService storageService;
  AuthLocalDataSourceImpl(this.storageService);

  @override
  Future<TokenModel> login() async {
    final tokenData = storageService.read('token');
    if (tokenData != null) {
      return TokenModel.formJson(tokenData);
    } else {
      throw Exception('Token tidak ditemukan');
    }
  }

  @override
  // Future<String> register() {
  //   final dataRegister =  storageService.read('register');

  //   if (dataRegister != null ) {
  //     r
  //   }
  // }

  @override
  Future<UserModel> getProfile() async {
    final profileData = await storageService.read('profile');
    if (profileData != null) {
      return UserModel.formJson(profileData);
    } else {
      throw Exception('No profile found in local storage');
    }
    // return storageService.read('profile');
  }
}
