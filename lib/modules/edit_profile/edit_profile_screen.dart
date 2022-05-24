
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
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
          appBar: AppBar(
            title: Text(
              'Edit Profile',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          body: Column(
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
                                IconBroken.Camera
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
                                  IconBroken.Camera
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Name Must not be Empty' ;
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          prefixIcon: Icon(IconBroken.User),
                          label: Text(
                              'Name'
                          )
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Bio Must not be Empty' ;
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          prefixIcon: Icon(IconBroken.Info_Circle),
                          label: Text(
                              'Bio'
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
