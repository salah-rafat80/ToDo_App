import 'package:flutter/material.dart';
class startImage extends StatelessWidget {
  const startImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 301,
      height: 342,
      child: Image(image: AssetImage("assets/images/start_image.png")),
    );
  }
}
class mainImage extends StatelessWidget {
  const mainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 400,
      child: Image(image: AssetImage("assets/images/flag_Images.png"),fit: BoxFit.fill,),
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
      child: Image(image: AssetImage("assets/images/empty_tasks.png"),fit: BoxFit.fill,),
    );
  }
}
