import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';
import 'package:video_player/video_player.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            cubit: cubit,
            text: 'Add Post',
            function: () {
              Navigator.pop(context);
              cubit.removePostPhoto();
            },
            action: TextButton(
                onPressed: () {
                  cubit.removePostPhoto();
                },
                child: Text('Post',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 30,
                          color: cubit.isDark ? Colors.black : Colors.white,
                        ))),
          ),
          /*AppBar(
            title: Text(
                'Add Post',
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                color: cubit.isDark? Colors.white : Colors.black,
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: cubit.isDark? Brightness.light : Brightness.dark,
                statusBarColor: Colors.transparent
            ),
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
            }, icon: Icon(
              Icons.arrow_back,
              color: cubit.isDark? Colors.white : Colors.black,
            )
            ),
            actions: [

              IconButton(
                iconSize: 70,
                  onPressed: (){

                  },
                  icon: Text(
                    'Post',
                      style: TextStyle(
                        fontSize: 25,
                        color: a,
                        fontWeight: FontWeight.w500
                  )
              )

              )
            ],
          ),*/

          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
                      ),
                      radius: 28,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Rafi Shoufan',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'What’s on your mind....',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(
                              color: cubit.isDark ? Colors.white : Colors.grey),
                      border: InputBorder.none,
                    ),
                    minLines: 1,
                    maxLines: 15,
                  ),
                ),
                if (cubit.postImages!.length > 0)
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.postImages!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 200,
                                width: 300,
                                child: Image.file(
                                  File(cubit.postImages![index].path),
                                  fit: BoxFit.cover,
                                ));
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              cubit.removePostPhoto();
                            },
                            icon: Icon(
                                IconBroken.Close_Square,
                            color: a1,)
                        )
                      ],
                    ),
                  ),
               /* Column(
                  children: <Widget>[
                    if(cubit.video != null)
                      cubit.videoPlayerController!.value.isInitialized
                          ? AspectRatio(
                        aspectRatio: cubit.videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(cubit.videoPlayerController),
                      )
                          : Container()
                   *//* else
                      Text("Click on Pick Video to select video", style: TextStyle(fontSize: 18.0),),
                    RaisedButton(
                      onPressed: () {
                        cubit.GetPostVideo();
                      },
                      child: Text("Pick Video From Gallery"),
                    ),*//*
                  ],
                ),*/
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            cubit.getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconBroken.Image),
                              SizedBox(
                                width: 10,
                              ),
                              Text('add photo')
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            cubit.getPostVideo();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconBroken.Play),
                              SizedBox(
                                width: 10,
                              ),
                              Text('add video')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
