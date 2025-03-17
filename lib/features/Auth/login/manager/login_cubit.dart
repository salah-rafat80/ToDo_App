import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Auth/login/data/model/login_model.dart';
import 'package:todo/features/Auth/login/data/repo/login_repo.dart';
import 'package:todo/features/Auth/login/manager/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController LoginNameController = TextEditingController();
  TextEditingController LoginPasswordController = TextEditingController();
  LoginRepo repo = LoginRepo.getinstance();

  void login({required UserModel u})async{
    emit(LoginLoading());
    var response = await repo.login( name: LoginNameController.text, password: LoginPasswordController.text);
    response.fold((l) {
      emit(LoginError(message: l));
    }, (r) {
      emit(LoginSuccess());
    });
  }

}