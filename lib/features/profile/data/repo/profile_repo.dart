import 'package:dartz/dartz.dart';
import 'package:todo/features/profile/data/profile_model/profile_model.dart';

 class ProfileRepo{
   ProfileRepo._internal();
  static ProfileRepo instance = ProfileRepo._internal();
   static getinstance (){
     return instance;
 }
   List<UserdataModel> userData = [];

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