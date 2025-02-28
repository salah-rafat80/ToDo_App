import 'package:flutter/material.dart';

import 'constant.dart';
class startText extends StatelessWidget {
  const startText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 160,
          height: 60,
          child: Text(
            textAlign: TextAlign.center,
            "Welcome To \nDo It !",
            style: TextStyle(
              color: Color(0xff24252C),

              fontSize: 24,
              fontFamily: fonts.lexendDeca,
              fontWeight: FontWeight.w400,
            ),

          ),
        ),
        SizedBox(height: 10,),
        Text(
          textAlign: TextAlign.center,
          "Ready to conquer your tasks? Let's Do\n It together.",
          style: TextStyle(
            color: Color(0xff6E6A7C),

            fontSize: 16,
            fontFamily: fonts.lexendDeca,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
TextEditingController textController = TextEditingController();

class TextForm extends StatefulWidget {
   TextForm({super.key});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.transparent),
          color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,


            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),

              borderSide: BorderSide.none

            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14),
            ),


            labelText: "Enter Your Name",
            labelStyle: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 9,
              fontFamily: fonts.lexendDeca,
              fontWeight: FontWeight.w400,
            ),
            hintText: "type your name here",
            hintStyle: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 14,
              fontFamily: fonts.lexendDeca,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
class textHome1 extends StatelessWidget {
  const textHome1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      height: 70,
      child: Text(
        textAlign: TextAlign.center,
        "There are no tasks yet,\nPress the button\n To add New Task ",style: TextStyle(color: Color(0xff24252C),fontSize: 16,fontFamily: fonts.lexendDeca,fontWeight: FontWeight.w300),),
    );
  }
}
class textFormefield extends StatelessWidget {
  textFormefield({super.key, required this.hintText, required this.label,});
  final String hintText;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      minLines:1,
      decoration: InputDecoration(

        filled: true,
        fillColor: Colors.white,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),

        hintText: "$hintText",hintStyle: TextStyle(fontFamily: fonts.lexendDeca,fontSize: 20,color: Color(0xff6E6A7C),fontWeight: FontWeight.w200,),
        labelText: '$label',labelStyle: TextStyle(fontFamily: fonts.lexendDeca,fontSize: 12,color: Color(0xff6E6A7C),fontWeight: FontWeight.w400),
      ),
    );
  }
}