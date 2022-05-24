import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/modules/edit_profile/edit_profile_screen.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 270,
                  child: Stack(
                    children: [
                      Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                         // gradient: linearGradient,
                            borderRadius:BorderRadius.only(
                              topLeft:Radius.circular(6) ,
                              topRight: Radius.circular(6),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/14.jpeg' ,),
                            )
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor ,
                              shape: BoxShape.circle,

                          ),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                                'https://images2.habeco.si/upload/images/Blog/6696.jpg'
                            ),
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
                Text(
                  'Rafi Shoufan',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 27
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Write Your Bio ...',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                           height: 3,
                          ),
                          Text(
                            'Posts',
                             style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Colors.grey
                              ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '156',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                           height: 3,
                          ),
                          Text(
                            'Photos',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '3K',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                           height: 3,
                          ),
                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                           height: 3,
                          ),
                          Text(
                            'Following',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: cubit.isDark ? Colors.white70 : Colors.black12
                          )
                        ),
                        onPressed: (){

                        },
                        child: Text(
                            'Add Photo'
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: OutlinedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                            MaterialPageRoute(
                                builder:(context) => EditProfileScreen(

                                ), ));
                      },
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: cubit.isDark ? Colors.white70 : Colors.black12
                              )
                          ),
                          child: Icon(
                              IconBroken.Edit,
                          )
                      ),
                    ),

                  ],
                )
              ],
            ),
          );
        },
    );
  }
}
