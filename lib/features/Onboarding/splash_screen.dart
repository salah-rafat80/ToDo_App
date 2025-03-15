import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/Onboarding/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.to(StartScreen(), duration: Duration(seconds: 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 21, bottom: 44),
            child: Center(
              child: SizedBox(
                height: 343,
                width: 334,
                child: SvgPicture.asset("assets/images/Splash_image.svg",fit: BoxFit.fill,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130, right: 131, top: 0),
            child: Text(
              "TODO",
              style: TextStyle(
                fontSize: 36,
                fontWeight: MyFontWeight.w9,
                color: AppColors.greenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
