import 'package:comunity_apps/features/auth/data/models/auth_model.dart';
import 'package:comunity_apps/features/auth/domain/usecases/login.dart';
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
    isLoading.value = false;

    result.fold(
      (data) {
        Get.snackbar('Berhasil', 'Login berhasil');
        // Login berhasil, arahkan ke home
        Get.offAllNamed('/home');
      },
      (failure) {
        // Login gagal
        Get.snackbar('Error', 'Login gagal');
      },
    );
  }
}
