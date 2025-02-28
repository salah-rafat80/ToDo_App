import 'package:flutter/material.dart';
import 'package:todo/wedigt/Button_wedgit.dart';
import 'package:todo/wedigt/constant.dart';
class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var info = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String name1 = info["name"];
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
                          Navigator.pushNamed(context, "OptionsScreen",arguments: name1);
                        },
                        child: UserData_Container(Name: name1,)),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: PlusButton(name: name1,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Center(child: BigContenar_home2()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 150,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("In progress",style: TextStyle(color: Color(0xff24252C),fontSize: 19,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),),
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
              SizedBox(height: 10,),
              Listview(),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: (10.0),right: 8),
                child: Text("Task Groups",style: TextStyle(color: Color(0xff24252C),fontSize: 14,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),),
              ),
              SizedBox(height: 20,),
              TaskGroupsList(),
            ]
          ),
        ),
      ),
    );
  }
}

