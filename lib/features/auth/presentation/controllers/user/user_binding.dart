import 'package:comunity_apps/features/auth/data/datasources/api/user_api.dart';
import 'package:comunity_apps/features/auth/data/repositories/user_repository_impl.dart';
import 'package:comunity_apps/features/auth/domain/usecases/profile.dart';

import 'package:comunity_apps/features/auth/presentation/controllers/user/user_controller.dart';

import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAPI>(() => UserAPIImpl(Get.find()));
    Get.lazyPut<UserRepositoryImpl>(() => UserRepositoryImpl(
          authLocalDataSource: Get.find(),
          userAPI: Get.find(),
          storageService: Get.find(),
        ));
    Get.lazyPut(() => ProfileUseCase(Get.find<UserRepositoryImpl>()));
    Get.lazyPut(() => UserController(Get.find<ProfileUseCase>()));

    Get.lazyPut(() => ProfileUseCase(Get.find<UserRepositoryImpl>()));
    Get.lazyPut(() => UserController(Get.find<ProfileUseCase>()));
  }
}
