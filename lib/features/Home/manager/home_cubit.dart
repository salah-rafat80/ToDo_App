import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Home/data/model/tasks_response_model.dart';
import 'package:todo/features/Home/data/repo/home_repo.dart';
import 'package:todo/features/Home/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getTasks() async {
    try {
      emit(HomeLoading()); // تغيير الحالة إلى التحميل
      await Future.delayed(Duration(seconds: 2)); // محاكاة تحميل البيانات

      Either<String, List<Tasks>> result = await HomeRepo.getinstance().getTasks(); // استرجاع البيانات

      result.fold(
            (failure) => emit(HomeError(message: failure)), // إذا كان هناك خطأ، تحديث الحالة
            (tasks) => emit(HomeSuccess(tasks: tasks)), // إذا نجح، تحديث الحالة بالمهام المحملة
      );
    } catch (e) {
      emit(HomeError(message: "حدث خطأ غير متوقع: ${e.toString()}")); // التعامل مع الأخطاء غير المتوقعة
    }
  }

}
