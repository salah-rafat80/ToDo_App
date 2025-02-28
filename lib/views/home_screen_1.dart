import 'package:flutter/material.dart';
import 'package:todo/wedigt/Button_wedgit.dart';
import 'package:todo/wedigt/constant.dart';
import 'package:todo/wedigt/images_wedget.dart';
import 'package:todo/wedigt/text_wedgit.dart';
class HomeScreen1 extends StatefulWidget {
   HomeScreen1({super.key});
  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}
class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    var info = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String name1 = info["name"];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "OptionsScreen",arguments: name1);
                      },
                      child: UserData_Container(Name: name1,)),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: PlusButton(name: name1,),
                  )
                ],
              ),
            ),
            SizedBox(height: 70,),
            textHome1(),
            SizedBox(height: 20,),
            ImageEmptyScreen(),
          ],
        ),
      ),
    );
  }
}
