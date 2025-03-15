import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Auth/register/data/model/register_model.dart';
import 'package:todo/features/Auth/register/data/repo/register_repo.dart';
import 'package:todo/features/Auth/register/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthRepo authRepo = AuthRepo();

  void register(UserModel u) async{
    emit(RegisterLoading());
    await Future.delayed(Duration(seconds: 1));
    var response =  authRepo.register(user: u);
      response.fold(
        (l) {
          emit(RegisterError(message: l));
        },
        (r) {
          emit(RegisterSuccess());
        },
      );
  }
}
