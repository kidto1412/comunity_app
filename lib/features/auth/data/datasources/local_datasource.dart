import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

abstract class AuthLocalDataSource {
  Future<LoginResponse> login();
  Future<ResponseProfile> getProfile();
  Future<String> register();
}

class AuthRemoteImplRemoteDataSource extends AuthLocalDataSource {
  final StorageService storageService;
  AuthRemoteImplRemoteDataSource(this.storageService);

  @override
  Future<LoginResponse> login() {
    return storageService.read('token');
  }

  @override
  @override
  Future<String> register() {
    return storageService.read('register');
  }

  @override
  Future<ResponseProfile> getProfile() {
    return storageService.read('profile');
  }
}
