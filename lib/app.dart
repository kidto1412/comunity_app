import 'package:comunity_apps/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:comunity_apps/theme/shared.dart';
import 'package:comunity_apps/widgets/ComunityCard.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: SafeArea(
          child: Center(),
        ));
  }
}
