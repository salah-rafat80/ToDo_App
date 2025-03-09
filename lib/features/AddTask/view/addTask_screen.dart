import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
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
    var info = ModalRoute.of(context)!.settings.arguments as String?;
    String? name1 = info;
    return  BlocBuilder<AddTaskCubit, AddTaskState>(builder: (context, state) {
      var cubit = AddTaskCubit.get(context);
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Add Task",style: TextStyle(color: Color(0xff24252C),fontSize: 19,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),)),
            leading: ArrowBack(),
          ),
          body: Column(
            children: [
              SizedBox(height: 20,),
              CustomDropdownButton(),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  width: 331,
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textFormefield(hintText: "Grocery Shopping App",label: "Task Name", controller: cubit.TaskNameController,),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 331,
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textFormefield(hintText: "Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products.", label: "Description", controller: cubit.TaskDescriptionController,),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Button(text: 'Save', onPress: (){
                var task = AddTaskModel(titleTask: cubit.TaskNameController.text, description: cubit.TaskDescriptionController.text );
                cubit.addTask(task: task);
                if(state is AddTaskLoading) {CircularProgressIndicator(color: Color(0xff149954),);};
                Get.to(HomeScreen2()); ;
              },),


            ],
          ),
        ),
      );
    });
  }
}
