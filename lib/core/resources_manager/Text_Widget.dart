import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/resources_manager/constant.dart';

class startText extends StatelessWidget {
  const startText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150.w,
          height: 80.h,
          child: Text(
            textAlign: TextAlign.center,
            "Welcome To \nDo It !",
            style: TextStyle(
              color: AppColors.darkColor,
              fontSize: 24.sp,
              fontFamily: fonts.lexendDeca,
              fontWeight: MyFontWeight.w4,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 314.w,
          height: 55.h,
          child: Text(
            textAlign: TextAlign.center,
            "Ready to conquer your tasks? Let's Do\n It together.",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontFamily: fonts.lexendDeca,
              fontWeight: MyFontWeight.w5,
            ),
          ),
        ),
      ],
    );
  }
}




TextEditingController textController = TextEditingController();

// class TextForm extends StatefulWidget {
//   TextForm({super.key});
//
//   @override
//   State<TextForm> createState() => _TextFormState();
// }
//
// class _TextFormState extends State<TextForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 340.w,
//       height: 60.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: Colors.transparent),
//         color: AppColors.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextFormField(
//           controller: textController,
//           decoration: InputDecoration(
//             fillColor: AppColors.white,
//             filled: true,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(14),
//               borderSide: BorderSide.none,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(14),
//             ),
//             labelText: "Enter Your Name",
//             labelStyle: TextStyle(
//               color: AppColors.textColor,
//               fontSize: 9.sp,
//               fontFamily: fonts.lexendDeca,
//               fontWeight: MyFontWeight.w4,
//             ),
//             hintText: "type your name here",
//             hintStyle: TextStyle(
//               color: AppColors.textColor,
//               fontSize: 14,
//               fontFamily: fonts.lexendDeca,
//               fontWeight: MyFontWeight.w2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class textHome1 extends StatelessWidget {
  const textHome1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      height: 85.h,
      child: Text(
        textAlign: TextAlign.center,
        "There are no tasks yet,\nPress the button\n To add New Task ",
        style: TextStyle(
          color: AppColors.textColor2,
          fontSize: 16.sp,
          fontFamily: fonts.lexendDeca,
          fontWeight: MyFontWeight.w3,
        ),
      ),
    );
  }
}

class textFormefield extends StatelessWidget {
  textFormefield({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
  });

  final TextEditingController controller;

  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      height: 70.h,
      child: TextFormField(
        controller: controller,
        maxLines: null,
        minLines: 1,
        decoration: InputDecoration(
          // floatingLabelBehavior: FloatingLabelBehavior.always,

          filled: true,
          fillColor: Colors.white,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15),
          ),

          hintText: "$hintText",
          hintStyle: TextStyle(
            fontFamily: fonts.lexendDeca,
            fontSize: 12.sp,
            color: AppColors.textColor,
            fontWeight: MyFontWeight.w2,
          ),
          labelText: '$label',
          labelStyle: TextStyle(
            fontFamily: fonts.lexendDeca,
            fontSize: 12.sp,
            color: AppColors.textColor,
            fontWeight: MyFontWeight.w3,
          ),
        ),
      ),
    );
  }
}
