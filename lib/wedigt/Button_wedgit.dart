import 'package:flutter/material.dart';
import 'package:todo/wedigt/text_wedgit.dart';

import '../views/profile_screen.dart';
import 'constant.dart';
class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.routNavigator, required this.name});
final String text ;
final dynamic routNavigator;
final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  {

        print(textController.text);
        Navigator.pushNamed(context, routNavigator,arguments: {"name":textController.text});
      },
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
              )
            ]
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 19,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),)),
      ),
    );
  }
}
class PlusButton extends StatelessWidget {
  const PlusButton({super.key, required this.name});
final String name ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, "AddTaskScreen",arguments: name);
        },
        child: Image(image: AssetImage("assets/Icons/Plus - Iconly Pro.png"),width: 60,height: 60,));
  }
}
class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: SizedBox(
              width: 21,
              height: 21,
              child: Image(image: AssetImage("assets/Icons/Arrow_back.png"),width: 21,height: 21,fit: BoxFit.fill))),
    );

  }
}
