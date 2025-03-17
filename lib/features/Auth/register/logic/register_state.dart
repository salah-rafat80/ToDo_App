abstract class RegisterState {}
class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
  String message;
  RegisterSuccess({ required this.message});
}
class RegisterError extends RegisterState {
   String message;
  RegisterError({ required this.message});
}
