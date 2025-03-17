import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/Onboarding/splash_screen.dart';
import 'package:todo/features/change_password/view/change_password_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        color: AppColors.primaryColor,
        home: SplashScreen(),
      ),
    );
  }
}
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedHangingLights(),
              SizedBox(height: 20),
              AnimatedHangingLights(),
            ],
          ),
        ),
      ),
    );
  }
}
