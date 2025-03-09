import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/features/Home/views/home_screen_1.dart';
import 'package:todo/features/profile/data/profile_model/profile_model.dart';
import 'package:todo/features/profile/logic/cubit/profile_cubit.dart';
import 'package:todo/features/profile/logic/cubit/profile_state.dart';
import '../../../core/resources_manager/Button_Widget.dart';
import '../../../core/resources_manager/Images_Widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainImage(),
              const SizedBox(height: 20),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  var cubit = context.watch<ProfileCubit>();
                  return textFormefield(
                    hintText: 'Profile Name',
                    controller: cubit.nameController,
                    label: "Profile Name",
                  );
                },
              ),
              const SizedBox(height: 40),
              BlocConsumer<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoadingState) {
                    return const CircularProgressIndicator();
                  } else {
                    return Builder(
                      builder: (context1) {
                        return Button(
                          text: 'Save',
                          onPress: () {
                            var cubit = context1.read<ProfileCubit>();
                            var user = UserdataModel(
                              name: cubit.nameController.text,
                            );
                            cubit.OnSaveProfile(userdata: user);
                          },
                        );
                      },
                    );
                  }
                },
                listener: (context, state) {
                  if (state is ProfileSuccessState) {
                    Get.to(() => HomeScreen1());
                  } else if (state is ProfileErrorState) {
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
