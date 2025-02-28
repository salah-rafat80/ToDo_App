import 'package:flutter/material.dart';
import 'package:todo/wedigt/Button_wedgit.dart';
import 'package:todo/wedigt/constant.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Settings",style: TextStyle(color: Color(0xff24252C),fontSize: 19,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),)),
          leading: ArrowBack(),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Notification",style: TextStyle(color: Color(0xff24252C),fontSize: 20,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),),
                    Spacer(),
                    switchh(),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Enable Cloud",style: TextStyle(color: Color(0xff24252C),fontSize: 20,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),),
                    Spacer(),
                    chackbox(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
