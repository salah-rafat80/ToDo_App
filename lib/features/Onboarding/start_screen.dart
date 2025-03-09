import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/features/Onboarding/options_screen.dart';
import 'package:todo/features/profile/view/profile_screen.dart';
import '../../core/resources_manager/Button_Widget.dart';
import '../../core/resources_manager/Images_Widget.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: StartImage(),
            ),
            SizedBox(height: 10,),
            startText(),
            const Spacer(),
            Button(text: 'Let’s Start',
              onPress: (){
              Get.to(ProfileScreen());
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
