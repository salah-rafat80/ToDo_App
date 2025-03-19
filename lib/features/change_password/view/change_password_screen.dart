import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/Images_Widget.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/features/change_password/data/model/change_pass_model.dart';
import 'package:todo/features/change_password/manager/change_pass_cubit.dart';
import 'package:todo/features/change_password/manager/change_pass_state.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePassCubit>(
      create: (context) {
        return ChangePassCubit();
      },
      child: Builder(
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MainImage(),
                      const SizedBox(height: 23),
                      textFormefield(
                        hintText: 'Current Password',
                        label: 'Current Password',
                        controller:
                        ChangePassCubit.get(context).currentPasswordController,
                      ),
                      SizedBox(height: 10),
                      textFormefield(
                        hintText: 'newPassword',
                        label: 'newPassword',
                        controller:
                        ChangePassCubit.get(context).newPasswordController,
                      ),
                      const SizedBox(height: 10),
                      textFormefield(
                        hintText: 'Confirm New Password',
                        label: 'Confirm New Password',
                        controller:
                        ChangePassCubit.get(context).newPasswordConfirmController,
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<ChangePassCubit, ChangePassState>(
                        builder: (context, state) {
                          var cubit = ChangePassCubit.get(context);
                          print(state.toString());
                          if (state is ChangePassLoading) {
                            return CircularProgressIndicator();
                          } else {
                            return Button(
                              text: 'Save',
                              onPress: () {
                                var user = UserModelChangePass(
                                  currentPassword:
                                  cubit.currentPasswordController.text,
                                  newPassword: cubit.newPasswordController.text,
                                  newPasswordConfirm:
                                  cubit.newPasswordConfirmController.text,
                                );
                                cubit.changePassword(user);
                              },
                            );
                          }
                        },
                        listener: (context, state) {
                          if (state is ChangePassSuccess) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(state.message)));
                            // Get.to(SettingsScreen(), duration: Duration(seconds: 3));
                          } else if (state is ChangePassError) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(state.message)));
                          }
                        },
                      ),

                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}