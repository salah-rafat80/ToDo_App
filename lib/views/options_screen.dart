import 'package:flutter/material.dart';
import 'package:todo/wedigt/constant.dart';
class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var info = ModalRoute.of(context)!.settings.arguments as String;
    String name1 = info;
    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserData_Container(Name: name1,),
                SizedBox(height: 30,),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "profileScreen");
                    },
                    child: Countener(icon: Iconss.person_update, name: 'Update Profile',)),
                SizedBox(height: 20,),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "SettingsScreen");
                    },
                    child: Countener(icon: Iconss.settings, name: 'Settings',)),
                SizedBox(height: 20,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Countener extends StatelessWidget {
  const Countener({super.key, required this.name, required this.icon});
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
        padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                    child: Image.asset(icon,fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 10,),
                  Text(name,style: TextStyle(fontFamily: fonts.lexendDeca,fontSize: 14,color: Color(0xff24252C),fontWeight: FontWeight.w300),),

                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 22,
                height: 22,
                  child: Image(image: AssetImage("assets/Icons/Arrow_right.png"))),
            )
          ],
        ),
      ),
    );
  }
}
