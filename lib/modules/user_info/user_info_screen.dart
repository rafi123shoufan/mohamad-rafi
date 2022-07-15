import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/layout/layout_screen.dart';
import 'package:social_media/models/register_model.dart';
import 'package:social_media/modules/user_info/cubit/user_info_cubit.dart';
import 'package:social_media/modules/user_info/cubit/user_info_states.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    var cityController = TextEditingController();
    var bioController = TextEditingController();
    var studyingController = TextEditingController();
    var jobController = TextEditingController();
    var birthdateController = TextEditingController();
    var genderController = TextEditingController();
    return BlocProvider(
      create: (context) => UserInfoCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          if (state is SuccessSetUserInformation) {}
        },
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          var profileImage = LayoutCubit.get(context).profileImage;
          var coverImage = LayoutCubit.get(context).coverImage;
          return Scaffold(
            body: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 35),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'complete setup your profile',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 270,
                        child: Stack(
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  height: 190,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: cubit.coverImage == null
                                            ? AssetImage(
                                                'assets/images/14.jpeg')
                                            : Image.file(coverImage!).image,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        cubit.getCoverImage();
                                      },
                                      icon: Icon(
                                        IconBroken.Camera,
                                        color: cubit.isDark
                                            ? Theme.of(context).iconTheme.color
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  gradient: linearGradient2,
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 70,
                                        backgroundImage: cubit.profileImage ==
                                                null
                                            ? AssetImage(
                                                'assets/images/person1.png')
                                            : Image.file(profileImage!).image),
                                    CircleAvatar(
                                      child: IconButton(
                                          onPressed: () {
                                            LayoutCubit.get(context)
                                                .getProfileImage();
                                          },
                                          icon: Icon(
                                            IconBroken.Camera,
                                            color: cubit.isDark
                                                ? Theme.of(context)
                                                    .iconTheme
                                                    .color
                                                : Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            /* Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48),
                                child: Image.network('https://images2.habeco.si/upload/images/Blog/6696.jpg',
                                fit: BoxFit.cover,),
                              )
                          ),
                        )*/
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      myTextFormField(
                          controller: cityController,
                          function: (value) {
                            if (value!.isEmpty) {
                              return 'City Must not be Empty';
                            }
                          },
                          prefix: IconBroken.Location,
                          text: 'City'),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          controller: bioController,
                          function: (value) {
                            if (value!.isEmpty) {
                              return 'Bio Must not be Empty';
                            }
                          },
                          prefix: IconBroken.Document,
                          text: 'Bio'),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          controller: studyingController,
                          function: (value) {
                            if (value!.isEmpty) {
                              return 'Education Must not be Empty';
                            }
                          },
                          prefix: IconBroken.Filter_2,
                          text: 'Education'),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value) {
                            if (value!.isEmpty) {
                              return 'Job Must not be Empty';
                            }
                          },
                          prefix: IconBroken.Work,
                          text: 'Job',
                          controller: jobController),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value) {
                            if (value!.isEmpty) {
                              return 'birthdate Must not be Empty';
                            }
                          },
                          prefix: IconBroken.Work,
                          text: 'birthdate',
                          controller: birthdateController),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value) {
                            if (value!.isEmpty) {
                              return 'Gender Must not be Empty';
                            }
                          },
                          prefix: IconBroken.User1,
                          text: 'Gender',
                          controller: genderController),

                      /*Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // color: cubit.isDark ?darkCardColor : a4,
                            borderRadius: BorderRadius.circular(50),
                            gradient: linearGradient3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'Name',
                                  context: context,
                                  icon: IconBroken.User),
                              SizedBox(
                                height: 10,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'Phone',
                                  context: context,
                                  icon: IconBroken.Call),
                              SizedBox(
                                height: 10,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'City',
                                  context: context,
                                  icon: IconBroken.Location),
                              SizedBox(
                                height: 10,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'Email',
                                  context: context,
                                  icon: IconBroken.Message),
                              SizedBox(
                                height: 10,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'Bio',
                                  context: context,
                                  icon: IconBroken.Document),
                              SizedBox(
                                height: 10,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'Education',
                                  context: context,
                                  icon: IconBroken.Filter_2),
                              SizedBox(
                                height: 10,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'Job',
                                  context: context,
                                  icon: IconBroken.Work),
                              SizedBox(
                                height: 10,
                              ),
                              searchTextFormField(
                                  cubit: cubit,
                                  text: 'Gender',
                                  context: context,
                                  icon: IconBroken.User1),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),*/
                      SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<UserInfoCubit, UserInfoStates>(
                        listener: (context, state) {
                          if (state is SuccessSetUserInformation &&
                              state.userInfoModel != null) {
                            print(state);
                            if (state.userInfoModel.status == true) {
                              showToast(
                                  state.userInfoModel.message ??
                                      'successssssss',
                                  ToastStates.Success);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context)=> LayoutScreen()),
                                      (route) => false
                              );
                              print('success toast state');
                            } else  {
                              print('show error toast');
                              showToast(state.userInfoModel.message ?? 'error',
                                  ToastStates.Error);
                            }
                          }
                        },
                        builder: (context, state) {
                          var cubit1 = UserInfoCubit.get(context);
                          return ConditionalBuilder(
                            builder: (context) => GestureDetector(
                              onTap: () {
/*
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LayoutScreen(),), (route) => false);
*/
                                cubit1.setUserInformation(
                                    birthdate: birthdateController.text,
                                    gender: genderController.text,
                                    lived: cityController.text,
                                    Job: jobController.text,
                                    studing: studyingController.text,
                                    bio: bioController.text,
                                    Image: profileImage,
                                    Image_cover: coverImage);
                                print('something');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 55,
                                decoration: BoxDecoration(
                                    gradient: linearGradient,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                            condition: state is! LoadingSetUserInformation,
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
