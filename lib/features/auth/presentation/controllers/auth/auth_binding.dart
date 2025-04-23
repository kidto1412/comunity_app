import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:comunity_apps/features/auth/data/datasources/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/datasources/remote_datasource.dart';
import 'package:comunity_apps/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:comunity_apps/features/auth/data/repositories/profile_repository_impl.dart';
import 'package:comunity_apps/features/auth/domain/repositories/auth_repository.dart';
import 'package:comunity_apps/features/auth/domain/usecases/login.dart';
import 'package:comunity_apps/features/auth/domain/usecases/profile.dart';
import 'package:comunity_apps/features/auth/presentation/controllers/auth/auth_controller.dart';
import 'package:comunity_apps/features/auth/presentation/controllers/auth/profile_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(Get.find()));
    Get.lazyPut<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(Get.find())); // nanti bisa dipisah

    // Repository
    Get.lazyPut<AuthRepositoryImpl>(() => AuthRepositoryImpl(
          authLocalDataSource: Get.find(),
          authRemoteDataSource: Get.find(),
          storageService: Get.find(),
        ));

    Get.lazyPut<ProfileRepositoryImpl>(() => ProfileRepositoryImpl(
          authLocalDataSource: Get.find(),
          authRemoteDataSource: Get.find(),
          storageService: Get.find(),
        ));
    Get.lazyPut(() => ProfileUseCase(Get.find<ProfileRepositoryImpl>()));
    Get.lazyPut(() => ProfileController(Get.find<ProfileUseCase>()));

    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepositoryImpl>()));

    Get.lazyPut(() => LoginController(Get.find<LoginUseCase>()));
  }
}
