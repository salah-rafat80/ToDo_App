
import 'package:flutter/material.dart';
import 'package:todo/views/profile_screen.dart';
import 'package:todo/wedigt/constant.dart';

import '../wedigt/Button_wedgit.dart';
import '../wedigt/images_wedget.dart';
import '../wedigt/text_wedgit.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: startImage(),
            ),
            SizedBox(height: 10,),
            startText(),
            const Spacer(),
            Button(text: 'Let’s Start', routNavigator: "profileScreen",
              name: '',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
