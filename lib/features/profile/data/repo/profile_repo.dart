import 'package:dartz/dartz.dart';
import 'package:todo/features/profile/data/profile_model/profile_model.dart';
List<UserdataModel> userData = [];

 class ProfileRepo{
  Future<Either<String, void>> saveProfile({required UserdataModel userdata})async{
    try{


        await Future.delayed(Duration(seconds: 3));
        userData.add(userdata);
        return right(null);

    }catch(e){
      return left(e.toString());
    }
  }
}