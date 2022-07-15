import 'package:social_media/models/register_model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates {}

class MakePasswordVisible extends RegisterStates {}

class MakeConfirmPasswordVisible extends RegisterStates {}


class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {
  RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends RegisterStates {}

