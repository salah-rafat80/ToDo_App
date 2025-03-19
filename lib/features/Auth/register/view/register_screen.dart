import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/Images_Widget.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/Auth/login/view/login_screen.dart';
import 'package:todo/features/Auth/register/data/model/register_model.dart';
import 'package:todo/features/Auth/register/logic/register_cubit.dart';
import 'package:todo/features/Auth/register/logic/register_state.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
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
                      hintText: 'UserName',
                      label: 'UserName',
                      controller: RegisterCubit.get(context).nameController,
                    ),
                    const SizedBox(height: 10),
                    textFormefield(
                      hintText: 'Password',
                      label: 'Password',
                      controller: RegisterCubit.get(context).passwordController,
                    ),
                    SizedBox(height: 10),
                    textFormefield(
                      hintText: 'Confirm Password',
                      label: 'Confirm Password',
                      controller:
                          RegisterCubit.get(context).ConfirmPasswordController,
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        var cubit = RegisterCubit.get(context);
                        print(state.toString());
                        if (state is RegisterLoading) {
                          return CircularProgressIndicator();
                        } else {
                          return Button(
                            text: 'Register',
                            onPress: () {
                              var user = UserModel(
                                confirmpassword:
                                    cubit.ConfirmPasswordController.text,
                                name: cubit.nameController.text,
                                password: cubit.passwordController.text,
                              );
                              cubit.register(user);
                            },
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                          Get.to(
                            LoginScreen(),
                            duration: Duration(seconds: 3),
                          );
                        } else if (state is RegisterError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have An Account?     "),
                        InkWell(
                          child: Text("Login",style: MyTextStyle.blackS14W2,),
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                        ),
                      ],
                    )
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
