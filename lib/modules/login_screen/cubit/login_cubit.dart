import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/modules/login_screen/cubit/login_states.dart';
import 'package:social_media/shared/network/remote/dio_helper.dart';

import '../../../models/login_models.dart';
import '../../../shared/network/end_points.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context){
    return BlocProvider.of(context);
  }

  bool isPassword = true;
  void makePasswordVisible(){
    isPassword = !isPassword;
    emit(MakePasswordVisible());
  }



LoginModel ? loginModel ;
void userLogin({
 required String email,
 required String password
}){
  print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    emit(LoginLoadingState());
    print(state);
    DioHelper.postData(
        url: Login,
        data: {
          "email": email,
          "password": password
        }
    ).then((value) {
      print(state);
      loginModel = LoginModel.fromjson(value.data);
      print(value.data);
      emit(LoginSuccessState(loginModel!));
      print('success');
    }).catchError((error){
      print(state);
      emit(LoginErrorState());
      print(error.toString());
    });
}
}