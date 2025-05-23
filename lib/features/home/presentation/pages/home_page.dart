import 'package:comunity_apps/features/auth/presentation/controllers/user/user_controller.dart';
import 'package:comunity_apps/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:comunity_apps/theme/shared.dart';
import 'package:comunity_apps/widgets/ComunityCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: Obx(() {
        if (userController.loadProfile == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Header
                child: Row(
                  children: [
                    Obx(() {
                      final user = userController.profile.value;
                      if (user != null && user.photoProfile != null) {
                        return CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                              "http://localhost:3000/" + user.photoProfile!),
                        );
                      } else {
                        return CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                              'assets/images/profile.jpg'), // Default image
                        );
                      }
                    }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Good Morning"),
                          margin: EdgeInsets.only(left: 8.0),
                        ),
                        Obx(() {
                          final user = userController.profile.value;
                          if (user != null) {
                            return Container(
                              child: Text(
                                user.name,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(left: 8.0),
                            );
                          } else {
                            return Container(
                              child: Text(
                                "Fahriz Dimasqy",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(left: 8.0),
                            );
                          }
                        })
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Today Wheather",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            'Bandung, Jawa barat',
                            style: textWhite,
                          )),
                          Row(
                            children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Text(
                                    '28°',
                                    style: TextStyle(
                                        fontSize: 26.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Spacer(),
                              Image.asset(
                                'assets/images/cloudy.png',
                                width: 200.0,
                              )
                            ],
                          ),
                          Container(
                              child: Text(
                            'Humadity 82%',
                            style: textWhite,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Comunity
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Comunity",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              ComunityCard(),
              ComunityCard(),
              ComunityCard(),
              ComunityCard(),
            ],
          );
        }
      })),
    );
  }
}
