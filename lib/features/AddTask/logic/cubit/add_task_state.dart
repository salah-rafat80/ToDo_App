abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskError extends AddTaskState {
  final String message;
  AddTaskError({required this.message});
}

class AddTaskLoading extends AddTaskState {}
