import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/models/user_info_model.dart';
import 'package:social_media/modules/user_info/cubit/user_info_states.dart';
import 'package:social_media/shared/network/local/cache_helper.dart';
import 'package:social_media/shared/network/remote/dio_helper.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/network/end_points.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(InitialUserInfoState());

  static UserInfoCubit get(context){
    return BlocProvider.of(context);
  }

  UserInfoModel ? userInfoModel;
  void setUserInformation({
    required String birthdate,
    required String gender,
    required String lived,
    required String Job,
    required String studing,
    required String bio,
     File ? Image,
     File ? Image_cover
  }) {
    emit(LoadingSetUserInformation());
    print('state');
    DioHelper.postData(
        url: SetUserInfo,
        data: {
          'birthdate': birthdate,
          'gender' :gender,
          'lived' : lived,
          'Job' : Job,
          'studing' : studing,
          'bio' : bio,
          'Image' : Image,
          'Image_cover': Image_cover
        },
      token: token
    ).then((value) {
      print('token is : ${token}' );
      print(value.data.toString());
      print('success state');
      userInfoModel = UserInfoModel.fromjson(value.data);
      print('set user info sucess ');
      emit(SuccessSetUserInformation(userInfoModel!));
      print('set user info sucess ');
    }).catchError((error){
      emit(ErrorSetUserInformation());
      print(error.toString());
      print('set user info error ');
    });
  }
   /*uploadUserProfileImage() async{
    var fromData = FromData.fromMap()
  }*/
}
