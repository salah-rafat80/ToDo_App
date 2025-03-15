import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/core/resources_manager/Images_Widget.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/features/Onboarding/options_screen.dart';
import 'package:todo/features/profile/data/repo/profile_repo.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    String profileName = ProfileRepo.getinstance().userData[ProfileRepo.getinstance().userData.length - 1].name.toString();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(OptionsScreen());
                    },
                    child: UserData_Container(Name: profileName),
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: PlusButton(name: profileName),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            textHome1(),
            SizedBox(height: 20),
            ImageEmptyScreen(),
          ],
        ),
      ),
    );
  }
}
