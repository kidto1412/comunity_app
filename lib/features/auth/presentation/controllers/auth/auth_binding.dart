import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:comunity_apps/features/auth/data/datasources/api/user_api.dart';
import 'package:comunity_apps/features/auth/data/datasources/local/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/api/auth_api.dart';
import 'package:comunity_apps/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:comunity_apps/features/auth/data/repositories/user_repository_impl.dart';

import 'package:comunity_apps/features/auth/domain/usecases/login.dart';
import 'package:comunity_apps/features/auth/domain/usecases/profile.dart';
import 'package:comunity_apps/features/auth/presentation/controllers/auth/auth_controller.dart';
import 'package:comunity_apps/features/auth/presentation/controllers/user/user_controller.dart';

import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<AuthAPI>(() => AuthAPIImpl(Get.find()));
    Get.lazyPut<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(Get.find())); // nanti bisa dipisah

    // Repository
    Get.lazyPut<AuthRepositoryImpl>(() => AuthRepositoryImpl(
          authLocalDataSource: Get.find(),
          authAPI: Get.find(),
          storageService: Get.find(),
        ));

    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepositoryImpl>()));

    Get.lazyPut(() => LoginController(Get.find<LoginUseCase>()));
  }
}
