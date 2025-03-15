import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_cubit.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_state.dart';

abstract class fonts {
  static const String lexendDeca = 'Lexend_Deca';
}

abstract class Iconss {
  static const String _baseUrl = "assets/Icons/";
  static const String plus_icon = "${_baseUrl}PlusIconPro.png";
  static const String home1 = "${_baseUrl}home1.png";
  static const String person1 = "${_baseUrl}person1.png";
  static const String bag1 = "${_baseUrl}bag1.png";
  static const String arrow_down = "${_baseUrl}Arrow_down.png";
  static const String person_update = "${_baseUrl}person_update.png";
  static const String settings = "${_baseUrl}settings.png";
}

abstract class AppColors {
  static const Color greenColor = Color(0xff149954);
  static const Color darkColor = Color(0xff24252C);
  static const Color primaryColor = Color(0xffF3F5F4);
  static const Color textColor = Color(0xff6E6A7C);
  static const Color textColor2 = Color(0xff24252C);
  static const Color litegreenColor = Color(0xffCEEBDC);
  static const Color white = Colors.white;
}

abstract class MyFontWeight {
  static FontWeight w1 = FontWeight.w100;
  static FontWeight w2 = FontWeight.w200;
  static FontWeight w3 = FontWeight.w300;
  static FontWeight w5 = FontWeight.w500;
  static FontWeight w4 = FontWeight.w400;
  static FontWeight w9 = FontWeight.w900;
}

abstract class MyTextStyle {
  static TextStyle greenS12W4 = TextStyle(
    color: AppColors.greenColor,
    fontSize: MyFontSizes.s12,
    fontFamily: fonts.lexendDeca,
    fontWeight: MyFontWeight.w4,
  );
}

abstract class MyFontSizes {
  static double s19 = 19;
  static double s14 = 14;
  static double s12 = 12;
  static double s24 = 24;
  static double s40 = 40;
}

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  final List<Map<String, dynamic>> items = [
    {"label": "Home", "icon": Iconss.home1, "color": Color(0xffFFE4F2)},
    {"label": "Work", "icon": Iconss.bag1, "color": Color(0xff372525)},
    {"label": "Personal", "icon": Iconss.person1, "color": Color(0xffCEEBDC)},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 331,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              'Selected Option',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontFamily: fonts.lexendDeca,
                color: Color(0xff24252C),
              ),
              overflow: TextOverflow.ellipsis,
            ),
            items:
                items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item["label"],
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        con(color: item["color"], iconPath: item["icon"]),
                        SizedBox(width: 10),
                        Text(
                          item["label"],
                          style: TextStyle(
                            fontFamily: fonts.lexendDeca,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            iconStyleData: IconStyleData(
              icon: SizedBox(
                width: 21,
                height: 21,
                child: Image(image: AssetImage(Iconss.arrow_down)),
              ),
            ),

            buttonStyleData: ButtonStyleData(
              height: 63,
              width: 331,

              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.transparent, width: 0),
                color: Colors.white,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              width: 331,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.transparent, width: 0),
                color: Colors.white,
              ),

              maxHeight: 200,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 65,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            ),
          ),
        ),
      ),
    );
  }
}

class UserData_Container extends StatelessWidget {
  const UserData_Container({super.key, required this.Name});

  final String? Name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 196,
      height: 60,
      child: Center(
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: AssetImage("assets/images/flag_Images.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: MyFontWeight.w3,
                  ),
                ),
                Text(
                  Name ?? "No Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: MyFontWeight.w5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

bool light = false;

class switchh extends StatefulWidget {
  const switchh({super.key});

  @override
  State<switchh> createState() => _switchhState();
}

class _switchhState extends State<switchh> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 1.3,
      scaleY: 1.2,

      child: Switch(
        value: light,
        onChanged: (value) {
          setState(() {
            light = value;
          });
        },
        activeColor: Colors.white,
        activeTrackColor: Color(0xff149954),
        inactiveTrackColor: Color(0xff6E6A7C),
        inactiveThumbColor: Colors.white,
        padding: EdgeInsets.all(10),
      ),
    );
  }
}

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              width: 234,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff1D1C1B),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "work",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: fonts.lexendDeca,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          smallContener(
                            color: Color(0xff149954),
                            iconPath: Iconss.bag1,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Add New Features",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: fonts.lexendDeca,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class BigContenar_home2 extends StatelessWidget {
  const BigContenar_home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 331,
        height: 133,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff149954),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Your today’s tasks\n almost done!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "80%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: fonts.lexendDeca,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 121,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "View Tasks",
                          style: TextStyle(
                            color: Color(0xff149954),
                            fontSize: 15,
                            fontFamily: fonts.lexendDeca,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class smallContener extends StatelessWidget {
  const smallContener({super.key, required this.color, required this.iconPath});

  final Color color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image.asset(iconPath, fit: BoxFit.contain),
      ),
    );
  }
}

class InprogressContiner extends StatelessWidget {
  const InprogressContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "In progress",
              style: TextStyle(
                color: Color(0xff24252C),
                fontSize: 19,
                fontFamily: fonts.lexendDeca,
                fontWeight: FontWeight.w300,
              ),
            ),
            Spacer(),
            Container(
              width: 14,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff14995426),
              ),
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(
                    color: Color(0xff149954),
                    fontSize: 12,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskGroupsList extends StatelessWidget {
  TaskGroupsList({super.key});

  @override
  Widget build(BuildContext context) {
    AddTaskCubit.get(context).getTasks();
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {},
      builder: (context1, state) {
        var cubit = AddTaskCubit.get(context1);
        return Center(
          child: SizedBox(
            height: 375,
            width: 340,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final task = cubit.addTaskRepo.addTaskList[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 335,
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Color(0xff000000).withOpacity(0.25), blurRadius: 4, offset: Offset(0, 4),spreadRadius: 0),
                      ],
                      color: AppColors.litegreenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 13.0),
                              child: Text(
                                cubit.addTaskRepo.addTaskList[index].titleTask,
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
                              padding: const EdgeInsets.only(right: 13.0, top: 13.0),
                              child: SizedBox(
                                height: 35,
                                width: 90,
                                child: Text(
                                  DateFormat('dd/MM/yyyy \n hh:mm a').format(task.createdAt),textAlign: TextAlign.center,
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
                          padding: const EdgeInsets.only(left: 12.0),
                          child: SizedBox(
                            width: 180.w,
                            child: Text(
                              cubit.addTaskRepo.addTaskList[index].description,
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
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: cubit.addTaskRepo.addTaskList.length,
            ),
          ),
        );
      },
    );
  }
}

class con extends StatelessWidget {
  const con({super.key, required this.color, required this.iconPath});

  final Color color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(iconPath, fit: BoxFit.contain),
      ),
    );
  }
}
