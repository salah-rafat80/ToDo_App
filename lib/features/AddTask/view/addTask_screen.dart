import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/Images_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';

import 'package:todo/features/AddTask/data/model/add_task_model.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_cubit.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_state.dart';
import 'package:todo/features/Home/views/home_screen_2.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTaskCubit>(
      create: (context) => AddTaskCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  color: Color(0xff24252C),
                  fontSize: 19,
                  fontFamily: fonts.lexendDeca,
                  fontWeight: MyFontWeight.w3,
                ),
              ),
            ),
            leading: ArrowBack(),
          ),
          body: Column(
            children: [
              SizedBox(height: 20),
              FlageImageContainer261w(),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 331,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),

                  child: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: textFormefield(
                          hintText: "Task Name",
                          label: "Task Name",
                          controller:
                              AddTaskCubit.get(context).TaskNameController,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 331,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  child: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: textFormefield(
                          hintText: "Description",
                          label: "Description",
                          controller:
                              AddTaskCubit.get(
                                context,
                              ).TaskDescriptionController,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              BlocConsumer<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  var cubit = AddTaskCubit.get(context);
                  if (state is AddTaskLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Button(
                      text: 'Save',
                      onPress: () {
                        var task = AddTaskModel(
                          createdAt: DateTime.now(),
                          titleTask: cubit.TaskNameController.text,
                          description: cubit.TaskDescriptionController.text,
                        );
                        AddTaskCubit.get(context).addTask(task: task);
                      },
                    );
                  }

                },
                listener: (BuildContext context, AddTaskState state) {
                  print(state.toString());
                  if (state is AddTaskSuccess) {
                    Get.to(HomeScreen2());
                  } else if (state is AddTaskError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
