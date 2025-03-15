import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/profile/data/repo/profile_repo.dart';
import 'package:todo/features/profile/view/profile_screen.dart';
import 'package:todo/features/settings/views/settings_screen.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String profileName = ProfileRepo.getinstance().userData[ProfileRepo.getinstance().userData.length - 1].name.toString();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserData_Container(Name: profileName),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Get.to(ProfileScreen());},
                  child: ContainerIcon(
                    icon: Iconss.person_update,
                    name: 'Update Profile',
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(SettingsScreen());
                  },
                  child: ContainerIcon(icon: Iconss.settings, name: 'Settings'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

