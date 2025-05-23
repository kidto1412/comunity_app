import 'package:comunity_apps/core/core_binding.dart';
import 'package:comunity_apps/core/routes/router.dart';
import 'package:comunity_apps/features/home/presentation/pages/home_page.dart';
import 'package:comunity_apps/features/auth/presentation/pages/login_page.dart';
import 'package:comunity_apps/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CoreBinding(),
      initialRoute: AppRouter.login,
      getPages: AppPages.routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
