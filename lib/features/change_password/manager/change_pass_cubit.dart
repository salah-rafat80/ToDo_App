import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Auth/register/data/model/register_model.dart';
import 'package:todo/features/Auth/register/logic/register_state.dart';
import 'package:todo/features/change_password/data/model/change_pass_model.dart';
import 'package:todo/features/change_password/data/repo/change_pass_repo.dart';
import 'package:todo/features/change_password/manager/change_pass_state.dart';
class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());

  static ChangePassCubit get(context) => BlocProvider.of(context);
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmController = TextEditingController();

  ChangePassRepo changePassRepo = ChangePassRepo.getinstance();

  void changePassword(UserModelChangePass u) async {
    emit(ChangePassLoading());
    var response =await changePassRepo.changePassword(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
      newPasswordConfirm: newPasswordConfirmController.text,
    );
    response.fold(
          (l) {
        emit(ChangePassError(message: l));
      },
          (r) {
        emit(ChangePassSuccess(message: r));
      },
    );
  }
}
