import 'package:flutter/material.dart';

class StartImage extends StatelessWidget {
  const StartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301,
      height: 342,
      child: Image(image: AssetImage("assets/images/start_image.png")),
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

      width: 375,
      height: 400,
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
      child: Image(
        image: AssetImage("assets/images/empty_tasks.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}
