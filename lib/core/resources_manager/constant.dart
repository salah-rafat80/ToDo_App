import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_cubit.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_state.dart';

abstract class fonts {
  static const String lexendDeca = 'Lexend_Deca';
}

abstract class Iconss {
  static const String _baseUrl = "assets/Icons/";
  static const String plus_icon = "${_baseUrl}PlusIconPro.png";
  static const String home1 = "${_baseUrl}home1.png";
  static const String person1 = "${_baseUrl}person1.png";
  static const String bag1 = "${_baseUrl}bag1.png";
  static const String arrow_down = "${_baseUrl}Arrow_down.png";
  static const String person_update = "${_baseUrl}person_update.png";
  static const String settings = "${_baseUrl}settings.png";
}

abstract class AppColors {
  static const Color greenColor = Color(0xff149954);
  static const Color darkColor = Color(0xff24252C);
  static const Color primaryColor = Color(0xffF3F5F4);
  static const Color textColor = Color(0xff6E6A7C);
  static const Color textColor2 = Color(0xff24252C);
  static const Color litegreenColor = Color(0xffCEEBDC);
  static const Color white = Colors.white;
}

abstract class MyFontWeight {
  static FontWeight w1 = FontWeight.w100;
  static FontWeight w2 = FontWeight.w200;
  static FontWeight w3 = FontWeight.w300;
  static FontWeight w5 = FontWeight.w500;
  static FontWeight w4 = FontWeight.w400;
  static FontWeight w9 = FontWeight.w900;
}

abstract class MyTextStyle {
  static TextStyle greenS12W4 = TextStyle(
    color: AppColors.greenColor,
    fontSize: MyFontSizes.s12,
    fontFamily: fonts.lexendDeca,
    fontWeight: MyFontWeight.w4,
  );
  static TextStyle blackS14W2 = TextStyle(
    color: AppColors.darkColor,
    fontSize: MyFontSizes.s14,
    fontFamily: fonts.lexendDeca,
    fontWeight: MyFontWeight.w9,
  );

}

abstract class MyFontSizes {
  static double s19 = 19;
  static double s14 = 14;
  static double s12 = 12;
  static double s24 = 24;
  static double s40 = 40;
}

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  final List<Map<String, dynamic>> items = [
    {"label": "Home", "icon": Iconss.home1, "color": Color(0xffFFE4F2)},
    {"label": "Work", "icon": Iconss.bag1, "color": Color(0xff372525)},
    {"label": "Personal", "icon": Iconss.person1, "color": Color(0xffCEEBDC)},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 331,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              'Selected Option',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontFamily: fonts.lexendDeca,
                color: Color(0xff24252C),
              ),
              overflow: TextOverflow.ellipsis,
            ),
            items:
                items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item["label"],
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        con(color: item["color"], iconPath: item["icon"]),
                        SizedBox(width: 10),
                        Text(
                          item["label"],
                          style: TextStyle(
                            fontFamily: fonts.lexendDeca,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            iconStyleData: IconStyleData(
              icon: SizedBox(
                width: 21,
                height: 21,
                child: Image(image: AssetImage(Iconss.arrow_down)),
              ),
            ),

            buttonStyleData: ButtonStyleData(
              height: 63,
              width: 331,

              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.transparent, width: 0),
                color: Colors.white,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              width: 331,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.transparent, width: 0),
                color: Colors.white,
              ),

              maxHeight: 200,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 65,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            ),
          ),
        ),
      ),
    );
  }
}

class UserData_Container extends StatelessWidget {
  const UserData_Container({super.key, required this.Name});

  final String? Name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 196,
      height: 60,
      child: Center(
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: AssetImage("assets/images/flag_Images.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: MyFontWeight.w3,
                  ),
                ),
                Text(
                  Name ?? "No Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: MyFontWeight.w5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

bool light = false;

class switchh extends StatefulWidget {
  const switchh({super.key});

  @override
  State<switchh> createState() => _switchhState();
}

class _switchhState extends State<switchh> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 1.3,
      scaleY: 1.2,

      child: Switch(
        value: light,
        onChanged: (value) {
          setState(() {
            light = value;
          });
        },
        activeColor: Colors.white,
        activeTrackColor: Color(0xff149954),
        inactiveTrackColor: Color(0xff6E6A7C),
        inactiveThumbColor: Colors.white,
        padding: EdgeInsets.all(10),
      ),
    );
  }
}

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              width: 234,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff1D1C1B),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "work",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: fonts.lexendDeca,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          smallContener(
                            color: Color(0xff149954),
                            iconPath: Iconss.bag1,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Add New Features",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: fonts.lexendDeca,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class BigContenar_home2 extends StatelessWidget {
  const BigContenar_home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 331,
        height: 133,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff149954),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Your today’s tasks\n almost done!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "80%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: fonts.lexendDeca,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 121,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "View Tasks",
                          style: TextStyle(
                            color: Color(0xff149954),
                            fontSize: 15,
                            fontFamily: fonts.lexendDeca,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class smallContener extends StatelessWidget {
  const smallContener({super.key, required this.color, required this.iconPath});

  final Color color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image.asset(iconPath, fit: BoxFit.contain),
      ),
    );
  }
}

class InprogressContiner extends StatelessWidget {
  const InprogressContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "In progress",
              style: TextStyle(
                color: Color(0xff24252C),
                fontSize: 19,
                fontFamily: fonts.lexendDeca,
                fontWeight: FontWeight.w300,
              ),
            ),
            Spacer(),
            Container(
              width: 14,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff14995426),
              ),
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(
                    color: Color(0xff149954),
                    fontSize: 12,
                    fontFamily: fonts.lexendDeca,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AnimatedHangingLights extends StatefulWidget {
  @override
  _AnimatedHangingLightsState createState() => _AnimatedHangingLightsState();
}

class _AnimatedHangingLightsState extends State<AnimatedHangingLights> with SingleTickerProviderStateMixin {
  List<double> opacities = List.generate(12, (index) => 0.3);
  final List<Color> colors = [Colors.cyan, Colors.pink, Colors.green, Colors.blue];
  final Random random = Random();
  late AnimationController _controller;
  late Animation<double> _swingAnimation;

  @override
  void initState() {
    super.initState();

    // تشغيل الوميض العشوائي لكل لمبة
    for (int i = 0; i < opacities.length; i++) {
      _startBlinking(i);
    }

    // إعداد التأرجح للفانوس
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _swingAnimation = Tween<double>(begin: -pi / 8, end: pi / 8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _startBlinking(int index) {
    Future.delayed(Duration(milliseconds: random.nextInt(1000) + 500), () {
      Timer.periodic(Duration(milliseconds: random.nextInt(800) + 500), (timer) {
        setState(() {
          opacities[index] = opacities[index] == 1.0 ? 0.2 : 1.0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // حساب إحداثيات الفانوس
        double centerX = 175; // نصف عرض الـ CustomPaint (400)
        double baseY = 200 / 3 + 30; // الموضع الرأسي الأساسي
        double swingOffset = 30 * sin(_swingAnimation.value);
        double lanternX = centerX + swingOffset;
        double lanternY = baseY + 50 * cos(_swingAnimation.value);
        Color glowColor = colors[(DateTime.now().second % 4)];

        return Stack(
          children: [
            CustomPaint(
              size: Size(400, 200),
              painter: HangingLightsPainter(opacities, colors, _swingAnimation.value),
            ),

            Positioned(
              left: lanternX - 15, // تعويض نصف عرض الصورة
              top: lanternY - 15, // تعويض نصف ارتفاع الصورة
              child: Stack(
                children: [
                  // الطبقة الأولى: توهج قوي
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SvgPicture.asset(
                      'assets/images/ramadan.svg',
                      width: 30,
                      height: 50,
                      color: glowColor.withOpacity(0.3),
                    ),
                  ),
                  // الطبقة الثانية: توهج متوسط
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: SvgPicture.asset(
                      'assets/images/ramadan.svg',
                      width: 30,
                      height: 50,
                      color: glowColor.withOpacity(0.5),
                    ),
                  ),
                  // الصورة الأصلية
                  SvgPicture.asset(
                    'assets/images/ramadan.svg',
                    width: 30,
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HangingLightsPainter extends CustomPainter {
  final List<double> opacities;
  final List<Color> colors;
  final double swingAngle;
  final int numBulbs = 10;

  HangingLightsPainter(this.opacities, this.colors, this.swingAngle);

  @override
  void paint(Canvas canvas, Size size) {
    Paint wirePaint = Paint()
      ..color = Colors.grey[800]!
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double midX = size.width / 2;
    double midY = size.height / 3;

    // رسم السلك الرئيسي المنحني
    path.moveTo(0, midY);
    path.quadraticBezierTo(midX / 2, midY + 30, midX, midY + 30);
    path.quadraticBezierTo(midX + (midX / 2), midY + 30, size.width, midY);

    canvas.drawPath(path, wirePaint);

    // توزيع اللمبات مع تعليقها على السلك
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.first;

    for (int i = 0; i < numBulbs; i++) {
      double t = i / (numBulbs - 1);
      Tangent? tangent = pathMetric.getTangentForOffset(pathMetric.length * t);

      if (tangent != null) {
        Offset wirePosition = tangent.position;
        double hangingHeight = 25;
        Offset bulbPosition = Offset(wirePosition.dx, wirePosition.dy + hangingHeight);

        // رسم الخيط الذي يعلق اللمبة
        Paint stringPaint = Paint()
          ..color = Colors.grey[700]!
          ..strokeWidth = 1;
        canvas.drawLine(wirePosition, bulbPosition, stringPaint);

        // تأثير التوهج حول اللمبة
        Paint glowPaint = Paint()
          ..color = colors[i % colors.length].withOpacity(opacities[i])
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

        // جسم اللمبة
        Paint bulbPaint = Paint()
          ..color = colors[i % colors.length].withOpacity(opacities[i])
          ..style = PaintingStyle.fill;

        // القاعدة العلوية السوداء لللمبة
        Paint holderPaint = Paint()..color = Colors.black;

        // رسم التوهج واللمبة
        canvas.drawCircle(bulbPosition, 12, glowPaint);
        canvas.drawOval(Rect.fromCenter(center: bulbPosition, width: 12, height: 20), bulbPaint);
        canvas.drawRect(Rect.fromCenter(center: Offset(bulbPosition.dx, bulbPosition.dy - 10), width: 6, height: 6), holderPaint);
      }
    }

    // رسم الفانوس المتأرجح في المنتصف
    Offset middleWirePosition = pathMetric.getTangentForOffset(pathMetric.length / 2)!.position;
    Offset lanternTop = Offset(middleWirePosition.dx, middleWirePosition.dy );
    Offset lanternBottom = Offset(
      lanternTop.dx + 30 * sin(swingAngle),
      lanternTop.dy + 45 * cos(swingAngle),
    );

    // رسم الحبل المعلق للفانوس
    Paint lanternStringPaint = Paint()
      ..color = Colors.grey[700]!
      ..strokeWidth = 2;
    canvas.drawLine(lanternTop, lanternBottom, lanternStringPaint);

    // رسم الفانوس (استبدله بصورة فعلية لاحقًا)
    // Paint lanternPaint = Paint()..color = Colors.amber;
    // canvas.drawOval(Rect.fromCenter(center: lanternBottom, width: 30, height: 50), lanternPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class con extends StatelessWidget {
  const con({super.key, required this.color, required this.iconPath});

  final Color color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(iconPath, fit: BoxFit.contain),
      ),
    );
  }
}
