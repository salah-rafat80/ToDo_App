import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/settings/manegar/settings_cubit/settings_cubit.dart';
import 'package:todo/features/settings/manegar/settings_cubit/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SettingsCubit();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Color(0xff24252C),
                  fontSize: 19,
                  fontFamily: fonts.lexendDeca,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            leading: ArrowBack(),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Notification",
                            style: TextStyle(
                              color: Color(0xff24252C),
                              fontSize: 20,
                              fontFamily: fonts.lexendDeca,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(),
                          switchh(),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Enable Cloud",
                            style: TextStyle(
                              color: Color(0xff24252C),
                              fontSize: 20,
                              fontFamily: fonts.lexendDeca,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(),
                          Transform.scale(
                            scaleX: 1.5,
                            scaleY: 1.5,
                            child: Checkbox(
                              value: SettingsCubit.get(context).sign,
                              onChanged: (value) {
                                SettingsCubit.get(context).sign =
                                    value ?? SettingsCubit.get(context).sign;
                              },
                              checkColor: Colors.white,
                              activeColor: Color(0xff149954),
                              side: BorderSide(color: Color(0xff6E6A7C)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
