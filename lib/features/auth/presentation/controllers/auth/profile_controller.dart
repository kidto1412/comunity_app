import 'dart:developer';

import 'package:comunity_apps/features/auth/data/models/user_model.dart';
import 'package:comunity_apps/features/auth/domain/entities/auth.dart';
import 'package:comunity_apps/features/auth/domain/entities/user.dart';
import 'package:comunity_apps/features/auth/domain/usecases/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileUseCase profileUseCase;

  ProfileController(this.profileUseCase);
  var isLoading = false.obs;
  Rxn<User> profile = Rxn<User>();

  Future<void> getProfile() async {
    isLoading.value = true;
    final result = await profileUseCase.execute();
    print(result);
    isLoading.value = false;

    if (result.isRight()) {
      // profile.value =  result;
      Get.snackbar('Berhasil', 'Get profile',
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar('Error', 'Profile gagal',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // result.fold(
  //   (failed) {
  //     log('Profile faield: ${failed}');
  //   },
  //   (data) {
  //     profile.value = data;
  //     log('Profile: $data');
  //   },
  // );
  // }
}
