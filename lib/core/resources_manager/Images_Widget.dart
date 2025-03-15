import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartImage extends StatelessWidget {
  const StartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301.w,
      height: 350.h,
      child: SvgPicture.asset("assets/images/start_image.svg", fit: BoxFit.fill),
    );
  }
}
class FlageImageContainer261w extends StatelessWidget {
  const FlageImageContainer261w({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 261.w,
      height: 207.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/flag_Images.png"),
            fit: BoxFit.fill,
          )
      ),
    );
  }
}


class MainImage extends StatelessWidget {
  const MainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/flag_Images.png"),
          fit: BoxFit.fill,
        ),
      ),

      width: 375.w,
      height: 298.h,
    );
  }
}

class ImageEmptyScreen extends StatelessWidget {
  const ImageEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 268,
      child: SvgPicture.asset(
         "assets/images/Image_empty_screen1.svg",
        fit: BoxFit.fill,
      ),
    );
  }
}
