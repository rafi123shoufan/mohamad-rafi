import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/models/register_model.dart';
import 'package:social_media/modules/register_screen/cubit/register_states.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/network/remote/dio_helper.dart';

import '../../../shared/network/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());

  static  RegisterCubit get(context){
    return BlocProvider.of(context);
  }

  bool isPassword = true;
  void makePasswordVisible(){
    isPassword = !isPassword;
    emit(MakePasswordVisible());
  }

  bool confirmPassword = true;
  void makeConfirmPasswordVisible(){
    confirmPassword = !confirmPassword;
    emit(MakeConfirmPasswordVisible());
  }
  
  RegisterModel ? registerModel;
  void userRegister({
  required String name,
  required String email,
  required String password,
  required String password_confirmation,
}) {
    emit(RegisterLoadingState());
     DioHelper.postData(
        url: Register,
        data: {
          'name' : name,
          'email' : email,
          'password' :password,
          'password_confirmation' : password_confirmation
    }).then((value) {
       registerModel = RegisterModel.fromjson(value.data);
       print('cscscs');
       print('cscscs');

       emit(RegisterSuccessState(registerModel!));
     }).catchError((error){
      emit(RegisterErrorState());
      print(error.toString());
      print('erroor');
    });
  }
}