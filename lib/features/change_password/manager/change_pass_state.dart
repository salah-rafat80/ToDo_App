abstract class ChangePassState {}

class ChangePassInitial extends ChangePassState {}

class ChangePassLoading extends ChangePassState {}

class ChangePassError extends ChangePassState {
  String message;
  ChangePassError({required this.message});
}

class ChangePassSuccess extends ChangePassState {
  String message;
  ChangePassSuccess({required this.message});
}