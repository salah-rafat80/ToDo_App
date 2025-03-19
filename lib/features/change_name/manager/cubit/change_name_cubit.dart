import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/change_name/data/model/response_model.dart';
import 'package:todo/features/change_name/data/repo/change_name_repo.dart';
import 'package:todo/features/change_name/manager/cubit/change_name_state.dart';
import 'package:todo/features/change_password/data/model/change_pass_model.dart';

class ChangeNameCubit extends Cubit<ChangeNameState> {
  ChangeNameCubit() : super(ChangeNameInitial());

  static ChangeNameCubit get(context) => BlocProvider.of(context);


  final TextEditingController newNameController = TextEditingController();

  final ChangeNameRepo changeNameRepo = ChangeNameRepo.getInstance(); // Fixed method name

  void ChangeName({required UserdataModel user}) async {
    emit(ChangeNameLoading());

    var response = await ChangeNameRepo.getInstance().changeName(newName: newNameController.text);

    response.fold(
          (errorMessage) {
        emit(ChangeNameError(error: errorMessage));
      },
          (successMessage) {
        emit(ChangeNameSuccess(message: successMessage));
      },
    );
  }

  @override
  Future<void> close() {
    newNameController.dispose();
    return super.close();
  }
}
