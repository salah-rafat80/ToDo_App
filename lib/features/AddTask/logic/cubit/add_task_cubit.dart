import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/AddTask/data/model/add_task_model.dart';
import 'package:todo/features/AddTask/data/repo/add_task_repo.dart';
import 'package:todo/features/AddTask/logic/cubit/add_task_state.dart';

 class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit():super(AddTaskInitial());
  static AddTaskCubit get(context) => BlocProvider.of(context);
  TextEditingController TaskNameController = TextEditingController();
  TextEditingController TaskDescriptionController = TextEditingController();
  AddTaskRepo addTaskRepo=AddTaskRepo();
  void addTask({required AddTaskModel task})async{
    emit(AddTaskLoading());
    var response= await addTaskRepo.addTask(task: task);
    response.fold((l) {
      emit(AddTaskError());} , (r) { emit(AddTaskSuccess());
    });

  }
}