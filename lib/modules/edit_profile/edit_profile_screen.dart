
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var profileImage = LayoutCubit.get(context).profileImage;
        var coverImage = LayoutCubit.get(context).coverImage;
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
              context: context,
              text: 'Edit Profile',
              cubit: cubit,
              function: (){
                Navigator.pop(context);
              },
            action: TextButton(
                onPressed: (){

                }, child: Text(
                'Edit',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 30,
                  color: cubit.isDark ? Colors.black: Colors.white,
                )
            )
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 270,
                    child: Stack(
                      children: [
                        Stack(
                          alignment: Alignment.topRight ,
                          children: [
                            Container(
                              height: 190,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.only(
                                    topLeft:Radius.circular(6) ,
                                    topRight: Radius.circular(6),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: cubit.coverImage == null ?
                                    AssetImage('assets/images/14.jpeg'):
                                    Image.file(coverImage!).image,
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: CircleAvatar(
                                child: IconButton(
                                    onPressed: (){
                                      cubit.getCoverImage();
                                    }, icon: Icon(
                                    IconBroken.Camera,
                                  color:cubit.isDark? Theme.of(context).iconTheme.color : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor ,
                                shape: BoxShape.circle
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 70 ,
                                  backgroundImage :
                                      cubit.profileImage == null ?
                                  AssetImage('assets/images/person1.png') :
                                      Image.file(profileImage!).image
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: (){
                                        LayoutCubit.get(context).getProfileImage();
                                      }, icon: Icon(
                                      IconBroken.Camera,
                                    color:cubit.isDark? Theme.of(context).iconTheme.color : Colors.white,

                                  )
                                  ),
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

                  /*Column(
                    children: [
                      myTextFormField(
                          function: (value){
                            if(value!.isEmpty){
                              return 'Name Must not be Empty' ;
                            }
                          },
                          prefix: IconBroken.User,
                          text: 'Name'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value){
                            if(value!.isEmpty){
                              return 'Phone Must not be Empty' ;
                            }
                          },
                          prefix: IconBroken.Call,
                          text: 'Phone'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value){
                            if(value!.isEmpty){
                              return 'Bio Must not be Empty' ;
                            }
                          },
                          prefix: IconBroken.Document,
                          text: 'Bio'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value){
                            if(value!.isEmpty){
                              return 'Education Must not be Empty' ;
                            }
                          },
                          prefix: IconBroken.Filter_2,
                          text: 'Education'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value){
                            if(value!.isEmpty){
                              return 'Job Must not be Empty' ;
                            }
                          },
                          prefix: IconBroken.Work,
                          text: 'Job'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value){
                            if(value!.isEmpty){
                              return 'Gender Must not be Empty' ;
                            }
                          },
                          prefix: IconBroken.User1,
                          text: 'Gender'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      myTextFormField(
                          function: (value){
                            if(value!.isEmpty){
                              return 'City Must not be Empty' ;
                            }
                          },
                          prefix: IconBroken.Location,
                          text: 'City'
                      ),
                    ],
                  ),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // color: cubit.isDark ?darkCardColor : a4,
                          borderRadius: BorderRadius.circular(50),
                        gradient: linearGradient3
                      ),

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
                                icon: IconBroken.User
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            searchTextFormField(
                                cubit: cubit,
                                text: 'Phone',
                                context: context,
                                icon: IconBroken.Call
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            searchTextFormField(
                                cubit: cubit,
                                text: 'City',
                                context: context,
                                icon: IconBroken.Location
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            searchTextFormField(
                                cubit: cubit,
                                text: 'Email',
                                context: context,
                                icon: IconBroken.Message
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            searchTextFormField(
                                cubit: cubit,
                                text: 'Bio',
                                context: context,
                                icon: IconBroken.Document
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            searchTextFormField(
                                cubit: cubit,
                                text: 'Education',
                                context: context,
                                icon: IconBroken.Filter_2
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            searchTextFormField(
                                cubit: cubit,
                                text: 'Job',
                                context: context,
                                icon: IconBroken.Work
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            searchTextFormField(
                                cubit: cubit,
                                text: 'Gender',
                                context: context,
                                icon: IconBroken.User1
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
