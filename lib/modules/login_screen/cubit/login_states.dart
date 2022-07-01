import 'package:social_media/models/login_models.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates{}

class MakePasswordVisible extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates{}