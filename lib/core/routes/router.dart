import 'package:comunity_apps/features/auth/presentation/controllers/auth/auth_binding.dart';
import 'package:comunity_apps/features/auth/presentation/pages/login_page.dart';
import 'package:comunity_apps/features/auth/presentation/pages/register_page.dart';
import 'package:comunity_apps/features/home/presentation/pages/home_page.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String login = '/';
  static const String register = '/register';
  static const String home = '/home';
}

class AppPages {
  static final routes = [
    GetPage(
        name: AppRouter.login,
        page: () => const LoginPage(),
        transition: Transition.leftToRight, // ⬅️ Smooth transition
        transitionDuration: Duration(milliseconds: 500), // Optional
        binding: AuthBinding()),
    GetPage(
      name: AppRouter.register,
      page: () => const RegisterPage(),
      transition: Transition.rightToLeft, // ⬅️ Smooth transition
      transitionDuration: Duration(milliseconds: 500), // Optional
    ),
    GetPage(
      name: AppRouter.home,
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 500),
      page: () => const HomePage(),
    ),
  ];
}
