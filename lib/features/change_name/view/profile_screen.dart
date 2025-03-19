import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/features/Auth/login/view/login_screen.dart';
import 'package:todo/features/Home/views/home_screen_1.dart';
import 'package:todo/features/change_name/data/model/response_model.dart';
import 'package:todo/features/change_name/manager/cubit/change_name_cubit.dart';
import 'package:todo/features/change_name/manager/cubit/change_name_state.dart';
// import 'package:todo/features/profile/data/profile_model/profile_model.dart';
import 'package:todo/features/profile/logic/cubit/profile_cubit.dart';
import 'package:todo/features/profile/logic/cubit/profile_state.dart';
import '../../../core/resources_manager/Button_Widget.dart';
import '../../../core/resources_manager/Images_Widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeNameCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainImage(),
              const SizedBox(height: 20),
              BlocBuilder<ChangeNameCubit, ChangeNameState>(
                builder: (context, state) {
                  var cubit = context.watch<ChangeNameCubit>();
                  return textFormefield(
                    hintText: 'New Profile Name',
                    controller: cubit.newNameController,
                    label: "Profile Name",
                  );
                },
              ),
              const SizedBox(height: 40),
              BlocConsumer<ChangeNameCubit, ChangeNameState>(
                builder: (context, state) {
                  if (state is ChangeNameLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return Builder(
                      builder: (context1) {
                        return Button(
                          text: 'Save',
                          onPress: () {

                            var cubit = context1.read<ChangeNameCubit>();
                            var user = UserdataModel(
                              name: cubit.newNameController.text,
                            );
                            cubit.changeNameRepo.changeName(newName: user.name!);
                            Get.to(() => LoginScreen());
                          },
                        );
                      },
                    );
                  }
                },
                listener: (context, state) {
                  if (state is ChangeNameSuccess) {
                    Get.to(() => LoginScreen());
                  } else if (state is ChangeNameError) {
                    Get.snackbar("Error", "Failed to save profile");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
