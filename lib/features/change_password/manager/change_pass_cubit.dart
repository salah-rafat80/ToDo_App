import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/change_password/data/model/change_pass_model.dart';
import 'package:todo/features/change_password/data/repo/change_pass_repo.dart';
import 'package:todo/features/change_password/manager/change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());

  static ChangePassCubit get(context) => BlocProvider.of(context);

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController = TextEditingController();

  final ChangePassRepo changePassRepo = ChangePassRepo.getInstance(); // Fixed method name

  void changePassword(UserModelChangePass u) async {
    emit(ChangePassLoading());

    var response = await changePassRepo.changePassword(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
      newPasswordConfirm: newPasswordConfirmController.text,
    );

    response.fold(
          (errorMessage) {
        emit(ChangePassError(message: errorMessage));
      },
          (successMessage) {
        emit(ChangePassSuccess(message: successMessage));
      },
    );
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    newPasswordConfirmController.dispose();
    return super.close();
  }
}
