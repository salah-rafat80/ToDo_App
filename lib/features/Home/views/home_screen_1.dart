import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/core/resources_manager/Images_Widget.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/features/Home/manager/home_cubit.dart';
import 'package:todo/features/Home/manager/home_state.dart';
import 'package:todo/features/Onboarding/options_screen.dart';
import 'package:todo/features/profile/data/repo/profile_repo.dart';
import 'package:todo/main.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getTasks(); // تنفيذ getTasks() بعد بناء الواجهة
    });
  }

  @override
  Widget build(BuildContext context) {
    String profileName =
        ProfileRepo.getinstance()
            .userData[ProfileRepo.getinstance().userData.length - 1]
            .name
            .toString();

    return BlocProvider<HomeCubit>(
      create: (context) {
        return HomeCubit()..getTasks();
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
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
                          child: UserData_Container(Name: profileName),
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: PlusButton(name: profileName),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: BlocConsumer<HomeCubit, HomeState>(
                      builder: (context, state) {
                        print(state.toString());
                        if (state is HomeLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is HomeError) {
                          return Center(child: Text("خطأ: ${state.message}"));
                        } else if (state is HomeSuccess) {
                          if (state.tasks.isEmpty) {
                            return const Center(child: ImageEmptyScreen());
                          }
                          return Column(

                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 15.w),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Tasks",
                                      style: TextStyle(
                                        color: AppColors.darkColor,
                                        fontSize: MyFontSizes.s14,
                                        fontFamily: fonts.lexendDeca,
                                        fontWeight: MyFontWeight.w3,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Container(
                                    width: 14,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffCEEBDC),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.tasks.length
                                            .toString(),
                                        style: MyTextStyle.greenS12W4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Expanded(
                                child: Center(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      final task = state.tasks[index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 335,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(
                                                  0xff000000,
                                                ).withOpacity(0.25),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                                spreadRadius: 0,
                                              ),
                                            ],
                                            color: AppColors.litegreenColor,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 12.0,
                                                      top: 13.0,
                                                    ),
                                                    child: Text(
                                                      task.title??"",
                                                      style: TextStyle(
                                                        color: AppColors.textColor,
                                                        fontSize: 16.sp,
                                                        fontFamily: fonts.lexendDeca,
                                                        fontWeight: MyFontWeight.w4,
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      right: 13.0,
                                                      top: 13.0,
                                                    ),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 90,
                                                      child: Text(
                                                        task.createdAt ?? "",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: AppColors.textColor,
                                                          fontSize: 14.sp,
                                                          fontFamily: fonts.lexendDeca,
                                                          fontWeight: MyFontWeight.w4,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 12.0,
                                                ),
                                                child: SizedBox(
                                                  width: 180.w,
                                                  child: Text(
                                                    task.description ?? "",
                                                    maxLines: 2,
                                                    softWrap: true,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: AppColors.textColor2,
                                                      fontSize: 15.sp,
                                                      fontFamily: fonts.lexendDeca,
                                                      fontWeight: MyFontWeight.w3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: state.tasks.length,
                                  ),
                                ),
                              ),
                            ],
                          );
                          //   ListView.builder(
                          //   padding: const EdgeInsets.all(10),
                          //   itemCount: state.tasks.length,
                          //   itemBuilder: (context, index) {
                          //     final task = state.tasks[index];
                          //     return Card(
                          //       margin: const EdgeInsets.symmetric(vertical: 8),
                          //       child: ListTile(
                          //         leading: task.imagePath != null
                          //             ? Image.network(task.imagePath!, width: 50, height: 50, fit: BoxFit.cover)
                          //             : const Icon(Icons.task),
                          //         title: Text(task.title ?? "بدون عنوان"),
                          //         subtitle: Text(task.description ?? "بدون وصف"),
                          //         trailing: Text(task.createdAt ?? ""),
                          //       ),
                          //     );
                          //   },
                          // );
                        }
                        return Column(
                          children: [
                            textHome1(),
                            const SizedBox(height: 20),
                            const Center(child: ImageEmptyScreen()),
                          ],
                        );
                      },
                      listener: (context, state) {},
                    ),
                  ),
                ],
              ),
              // AnimatedHangingLights(),
            ]
          ),
        ),
      ),
    );
  }
}
