import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LayoutCubit , LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            drawer: Drawer(

              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: linearGradient
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,//Theme.of(context).scaffoldBackgroundColor ,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    'https://images2.habeco.si/upload/images/Blog/6696.jpg'
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rafi Shoufan',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.white
                              ),
                            ),
                            Text(
                              'rafishoufan@gmail.com',
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: cubit.isDark ? darkColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: (){

                              },
                              title: Text(
                                'Profile'
                              ),
                              leading: Icon(
                                  IconBroken.User,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            ListTile(
                              onTap: (){

                              },
                              title: Text(
                                  'Save'
                              ),
                              leading: Icon(
                                IconBroken.Bookmark,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            ListTile(
                              onTap: (){

                              },
                              title: Text(
                                  'History'
                              ),
                              leading: Icon(
                               Icons.history_toggle_off,
                              // IconBroken.Time_Circle,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            ListTile(
                              onTap: (){

                              },
                              title: Text(
                                  'Settings'
                              ),
                              leading: Icon(
                                IconBroken.Setting,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            Divider(
                              height: 2,
                              color: Colors.grey,
                            ),
                            ListTile(
                              onTap: (){

                              },
                              title: Text(
                                  'Logout'
                              ),
                              leading: Icon(
                                IconBroken.Logout,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: cubit.isDark ? Brightness.dark :Brightness.light,
                  statusBarColor: Colors.transparent
              ),
              iconTheme: IconThemeData(
                color: cubit.isDark ? Colors.black : Colors.white
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: linearGradient
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Breeze',
                    style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                      fontFamily: 'Handmade' ,
                      fontSize: 40,
                      color: cubit.isDark ? Colors.black : Colors.white
                    )
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: (){
                  cubit.changeAppMode();
                },
                    icon: Icon(Icons.brightness_2_outlined,color: cubit.isDark ? Colors.black : Colors.white,),
                  iconSize: 30 ,
                ),
                IconButton(onPressed: (){

                },
                  icon: Icon(IconBroken.Search , color: cubit.isDark ? Colors.black : Colors.white,),
                  iconSize: 30 ,
                ),
                SizedBox( width:5 ,),
              ],
            ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: /*Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      a,
                      a1
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
              ),
              child:*/ BottomNavigationBar(
                items: [
                BottomNavigationBarItem(icon: Icon(IconBroken.Home) ,label: 'Home' ),
                  BottomNavigationBarItem(icon: Icon(IconBroken.User) ,label: 'Profile' ),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Plus) ,label: 'Add Post'),
                BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'Chats'),
                BottomNavigationBarItem(icon: Icon(IconBroken.Notification) ,label: 'Notifications'),
              ],
                onTap: (index){
                  cubit.changeCurrentIndex(index);
                },
                currentIndex: cubit.currentIndex,
              unselectedItemColor: cubit.isDark ? Colors.black  :Colors.white,
              ),

          );
        },

    );
  }
}
