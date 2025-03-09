import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_cubit.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_state.dart';
import 'package:todo/features/Onboarding/options_screen.dart';
import 'package:todo/features/profile/data/repo/profile_repo.dart';
class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    String profileName=userData[userData.length-1].name.toString();
    return BlocBuilder<AddTaskCubit, AddTaskState>(builder: (context, state)
    {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: UserData_Container(Name: profileName,)),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: PlusButton(name: profileName,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(child: BigContenar_home2()),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 23),
                    child: SizedBox(
                        width: 120,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("In progress",style: TextStyle(color: Color(0xff24252C),fontSize: 14,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),),
                            Spacer(),
                            Container(
                              width: 14,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff14995426),
                              ),
                              child: Center(child: Text("5",style: TextStyle(color: Color(0xff149954),fontSize: 12,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w400),)),
                            ),
                          ],
                        )),
                  ),
                  Listview(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 23,top: 26),
                    child: Text("Task Groups",style: TextStyle(color: Color(0xff24252C),fontSize: 14,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),),
                  ),
                  TaskGroupsList(),
                ]
            ),
          ),
        ),
      );
    });
  }
}

