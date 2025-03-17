import 'package:todo/features/Home/data/model/tasks_response_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  String message;
  HomeError({required this.message});
}

class HomeSuccess extends HomeState {
  List<Tasks> tasks;
  HomeSuccess({required this.tasks});
}