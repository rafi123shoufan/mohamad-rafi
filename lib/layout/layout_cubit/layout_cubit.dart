import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/modules/add_post/add_post.dart';
import 'package:social_media/modules/chats/chats.dart';
import 'package:social_media/modules/home/home_screen.dart';
import 'package:social_media/modules/notifications/notifications.dart';
import 'package:social_media/modules/profile/profile.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super(InitialLayoutStates());

  static LayoutCubit get(BuildContext context){
    return BlocProvider.of(context);
  }

  int currentIndex = 0;
  List<Widget> Screens = [
    HomeScreen(),
    ProfileScreen(),
    AddPostScreen(),
    ChatScreen(),
    NotificationsScreen(),
  ];

   void changeCurrentIndex(int index){
    currentIndex = index ;
    print(state);
    print(currentIndex);
    emit(ChangeBottomNavBarState());
  }
  bool isDark = false;
  void changeAppMode(){
    isDark = ! isDark;
    print(isDark);
    print(state);
    emit(ChangeAppModeState());
  }

  var picker = ImagePicker();
  File ? profileImage;

  Future getProfileImage() async{
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery
    );
    if(pickedFile != null){
      profileImage = File(pickedFile.path);
      emit(SuccessPickedProfileImage());
      print(state);
    }else{
      emit(ErrorPickedProfileImage());
      print(state);
  }
  }

  File ? coverImage ;
  Future getCoverImage() async{
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery
    );
    if(pickedFile != null){
      coverImage = File(pickedFile.path);
      emit(SuccessPickedCoverImage());
    }
    else{
      emit(ErrorPickedCoverImage());
    }
  }
}
