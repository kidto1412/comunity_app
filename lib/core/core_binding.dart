import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_storage/get_storage.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());

    Get.lazyPut(() => GetStorage());

    Get.lazyPut<StorageService>(
        () => StorageService(box: Get.find<GetStorage>()));

    Get.lazyPut(() => NetworkClient(
          dio: Get.find<Dio>(),
          storageService: Get.find<StorageService>(),
        ));
  }
}
