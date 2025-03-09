import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_cubit.dart';
import 'package:todo/features/Onboarding/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTaskCubit>(
      create: (context) => AddTaskCubit(),
      child: GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        color: Color(0xffF3F5F4),
        home: StartScreen(),
      ),
    );
  }
}
