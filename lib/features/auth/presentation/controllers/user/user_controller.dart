import 'dart:developer';

import 'package:comunity_apps/features/auth/data/models/user_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';
import 'package:comunity_apps/features/auth/domain/usecases/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final ProfileUseCase profileUseCase;

  UserController(this.profileUseCase);
  var loadProfile = false.obs;
  Rxn<User> profile = Rxn<User>();

  Future<void> getProfile() async {
    loadProfile.value = true;
    final result = await profileUseCase.execute();
    print(result);

    result.fold(
      (failure) {
        // Gagal mendapatkan profile
        // Get.snackbar('Failed', 'Login gagal',
        //     backgroundColor: Colors.red, colorText: Colors.white);
        loadProfile.value = false;
      },
      (user) {
        // Berhasil mendapatkan profile
        profile.value = user;
        loadProfile.value = false;
        // Get.snackbar('Berhasil', 'Login berhasil',
        //     backgroundColor: Colors.green, colorText: Colors.white);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getProfile(); // Dipanggil otomatis setelah binding aktif di /home
  }
}
