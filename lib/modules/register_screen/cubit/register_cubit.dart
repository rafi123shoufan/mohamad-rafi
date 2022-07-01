import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/modules/register_screen/cubit/register_states.dart';

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
}