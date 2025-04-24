import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/domain/usecases/login.dart';
import 'package:comunity_apps/features/auth/domain/usecases/profile.dart';
import 'package:comunity_apps/features/auth/presentation/controllers/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  var isLoading = false.obs;
  var username = ''.obs;
  var password = ''.obs;

  void login() async {
    isLoading.value = true;
    final result = await loginUseCase.execute(
      AuthModel(username: username.value, password: password.value),
    );

    if (result.isRight()) {
      // await userController.getProfile();
      isLoading.value = false;
      Get.snackbar('Berhasil', 'Login Berhasil',
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed('/home');
    } else {
      isLoading.value = false;
      // Get.snackbar('Error', 'Login gagal',
      //     backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
