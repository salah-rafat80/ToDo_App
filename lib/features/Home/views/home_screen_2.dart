// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:todo/core/resources_manager/Button_Widget.dart';
// import 'package:todo/core/resources_manager/constant.dart';
// import 'package:todo/features/AddTask/logic/cubit/add_task_cubit.dart';
// import 'package:todo/features/AddTask/logic/cubit/add_task_state.dart';
// import 'package:todo/features/Onboarding/options_screen.dart';
// import 'package:todo/features/profile/data/repo/profile_repo.dart';
//
// class HomeScreen2 extends StatelessWidget {
//   const HomeScreen2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     String profileName =
//         ProfileRepo.getinstance()
//             .userData[ProfileRepo.getinstance().userData.length - 1]
//             .name
//             .toString();
//     return BlocProvider(
//       create: (context) => AddTaskCubit(),
//       child: Builder(
//         builder: (context) {
//           return SafeArea(
//             child: Scaffold(
//               body: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Get.to(OptionsScreen());
//                             },
//                             child: UserData_Container(Name: profileName),
//                           ),
//                           SizedBox(
//                             width: 24,
//                             height: 24,
//                             child: PlusButton(name: profileName),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 20.0,
//                         bottom: 23,
//                         top: 26,
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Tasks",
//                             style: TextStyle(
//                               color: AppColors.darkColor,
//                               fontSize: MyFontSizes.s14,
//                               fontFamily: fonts.lexendDeca,
//                               fontWeight: MyFontWeight.w3,
//                             ),
//                           ),
//                           SizedBox(width: 15.w),
//                           BlocBuilder<AddTaskCubit, AddTaskState>(builder: (context, state) {
//                             var cubit = AddTaskCubit.get(context);
//                             return Container(
//                               width: 14,
//                               height: 15,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Color(0xffCEEBDC),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "cubit.addTaskRepo.addTaskList.length"
//                                       .toString(),
//                                   style: MyTextStyle.greenS12W4,
//                                 ),
//                               ),
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                     // TaskGroupsList(),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       )
//     );
//   }
// }
