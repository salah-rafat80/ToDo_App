import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/resources_manager/Button_Widget.dart';
import 'package:todo/core/resources_manager/Images_Widget.dart';
import 'package:todo/core/resources_manager/Text_Widget.dart';
import 'package:todo/core/resources_manager/constant.dart';
import 'package:todo/features/Auth/login/data/model/login_model.dart';
import 'package:todo/features/Auth/login/manager/login_cubit.dart';
import 'package:todo/features/Auth/login/manager/login_state.dart';
import 'package:todo/features/profile/view/profile_screen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
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
                      controller: LoginCubit.get(context).LoginNameController,
                    ),
                    const SizedBox(height: 10),
                    textFormefield(
                      hintText: 'Password',
                      label: 'Password',
                      controller: LoginCubit.get(context).LoginPasswordController,
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<LoginCubit, LoginState>(
                      builder: (context, state) {
                        var cubit = LoginCubit.get(context);
                        print(state.toString());
                        if (state is LoginLoading) {
                          return CircularProgressIndicator();
                        } else {
                          return Button(
                            text: 'Login',
                            onPress: () {
                              var user = UserModel(
                                name: cubit.LoginNameController.text,
                                password: cubit.LoginPasswordController.text,
                              );
                              cubit.login(u: user);
                            },
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Success")),
                          );
                          
                          Get.to(
                            ProfileScreen(),
                            duration: Duration(seconds: 3),
                          );
                        } else if (state is LoginError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error ${state.message}")),
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
