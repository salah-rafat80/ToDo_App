import 'package:flutter/material.dart';
import 'package:todo/views/addTask_screen.dart';
import 'package:todo/views/home_screen_1.dart';
import 'package:todo/views/home_screen_2.dart';
import 'package:todo/views/profile_screen.dart';
import 'package:todo/views/options_screen.dart';
import 'package:todo/views/settings_screen.dart';
import 'package:todo/views/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),

      debugShowCheckedModeBanner: false,
      routes: {
        "HomeScreen1": (context) => HomeScreen1(),
        "profileScreen": (context) => profileScreen(),
        "AddTaskScreen": (context) => AddTaskScreen(),
        "OptionsScreen": (context) => OptionsScreen(),
        "SettingsScreen": (context) => SettingsScreen(),
        "HomeScreen2": (context) => HomeScreen2(),
      },
      color: Color(0xffF3F5F4),
      home: StartScreen(),
    );
  }
}
