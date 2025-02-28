import 'package:flutter/material.dart';
import 'package:todo/views/start_screen.dart';

import '../wedigt/Button_wedgit.dart';
import '../wedigt/images_wedget.dart';
import '../wedigt/text_wedgit.dart';
import 'home_screen_1.dart';
class profileScreen extends StatelessWidget {
  const profileScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          mainImage(),
          SizedBox(height: 20,),
          TextForm(),
          SizedBox(height: 40,),
          Button(text: 'Save', routNavigator: "HomeScreen1", name: '',),
        ]
      ),
    ));
  }
}
