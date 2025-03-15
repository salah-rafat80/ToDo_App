import 'package:dartz/dartz.dart';
import 'package:todo/features/Auth/register/data/model/register_model.dart';
class AuthRepo {
List <UserModel> users = [];
// final APIHelper _APIHelper = APIHelper();
Either<String,void> register({ required UserModel user}) {
  // void fetchData() async {
  //   try {
  //     final response = await APIHelper().get('/users');
  //     print(response.data);
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  try {
    if(user.password != user.confirmpassword){
      return left("password doesn't match");
    };
    users.add(user);
    return right(0);
  }catch(e){
    return left(e.toString());
  }

}


}