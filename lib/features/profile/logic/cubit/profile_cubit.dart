import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/profile/data/profile_model/profile_model.dart';
import 'package:todo/features/profile/data/repo/profile_repo.dart';
import 'package:todo/features/profile/logic/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();


  ProfileRepo profileRepo = ProfileRepo();
  void OnSaveProfile({required UserdataModel userdata}) async{
    emit(ProfileLoadingState());
    var response = await profileRepo.saveProfile(userdata: UserdataModel(name: nameController.text));

    response.fold((l) {
      emit(ProfileErrorState());
    }, (r) {
      emit(ProfileSuccessState());
    });
  }

}