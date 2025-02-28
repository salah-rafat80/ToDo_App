import 'package:flutter/material.dart';
import 'package:todo/wedigt/Button_wedgit.dart';
import 'package:todo/wedigt/constant.dart';
import 'package:todo/wedigt/text_wedgit.dart';
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var info = ModalRoute.of(context)!.settings.arguments as String;
    String name1 = info;
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
                  child: textFormefield(hintText: "Grocery Shopping App",label: "Task Name",),
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
                  child: textFormefield(hintText: "Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products.", label: "Description"),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Button(text: 'Save', routNavigator: "HomeScreen2",name:name1),


          ],
        ),
      ),
    );
  }
}
