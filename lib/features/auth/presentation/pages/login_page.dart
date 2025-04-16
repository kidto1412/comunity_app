import 'package:comunity_apps/core/local/storage_service.dart';
import 'package:comunity_apps/core/network/network_client.dart';
import 'package:comunity_apps/core/routes/router.dart';
import 'package:comunity_apps/features/auth/data/datasources/local_datasource.dart';
import 'package:comunity_apps/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:comunity_apps/features/auth/presentation/controllers/auth/auth_controller.dart';
import 'package:comunity_apps/theme/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<bool> isSelected = <bool>[true, false];
  // TextEditingController usernameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  hintText: 'No Hp / Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  hintText: 'Kata Sandi',
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRouter.home);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                )),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Lupa password",
                  style: textBlue,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Atau", style: TextStyle(color: Colors.black54)),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Belum punya akun?"),
                  ),
                  Container(
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(AppRouter.register);
                          },
                          child: Text('Daftar', style: textBlue)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
