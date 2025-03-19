abstract class ChangeNameState {}

class ChangeNameInitial extends ChangeNameState {}

class ChangeNameLoading extends ChangeNameState {}

class ChangeNameError extends ChangeNameState {
  final String error;
  ChangeNameError({required this.error});
}

class ChangeNameSuccess extends ChangeNameState {
  final String message;
  ChangeNameSuccess({required this.message});
}