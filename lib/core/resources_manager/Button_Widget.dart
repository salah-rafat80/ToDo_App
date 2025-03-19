import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/features/AddTask/view/addTask_screen.dart';
import 'constant.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.onPress});

  final String text;

  final dynamic onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 331,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xff149954),
          boxShadow: [
            BoxShadow(
              color: Color(0xff149954),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: MyFontSizes.s19,
              fontFamily: fonts.lexendDeca,
              fontWeight: MyFontWeight.w3,
            ),
          ),
        ),
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(AddTaskScreen(user: name!,));
      },
      child: Image(
        image: AssetImage("assets/Icons/PlusIconPro.png"),
        width: 60,
        height: 60,
      ),
    );
  }
}

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({super.key, required this.name, required this.icon});

  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331,
      height: 63,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(icon, fit: BoxFit.fill),
                  ),
                  SizedBox(width: 10),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: fonts.lexendDeca,
                      fontSize: 14,
                      color: Color(0xff24252C),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: Image(image: AssetImage("assets/Icons/Arrow_right.png")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: 21,
          height: 21,
          child: Image(
            image: AssetImage("assets/Icons/Arrow_back.png"),
            width: 21,
            height: 21,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
