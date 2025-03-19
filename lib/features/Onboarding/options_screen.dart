import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/change_name/view/profile_screen.dart';
import 'package:todo/features/change_password/view/change_password_screen.dart';
import 'package:todo/features/settings/views/settings_screen.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key, required this.profileName});
 final  String profileName;
  @override
  Widget build(BuildContext context) {

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
                    Get.to(PasswordChangePage());},
                  child: ContainerIcon(
                    icon: Iconss.person_update,
                    name: 'Change Password',
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(ProfileScreen());
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

