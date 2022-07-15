import '../../../models/user_info_model.dart';

abstract class UserInfoStates{}

class InitialUserInfoState extends UserInfoStates{}


class LoadingSetUserInformation extends UserInfoStates{}
class SuccessSetUserInformation extends UserInfoStates{
  UserInfoModel  userInfoModel;
  SuccessSetUserInformation(this.userInfoModel);
}
class ErrorSetUserInformation extends UserInfoStates{}

