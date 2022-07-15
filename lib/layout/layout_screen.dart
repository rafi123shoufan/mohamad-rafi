import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/modules/add_post/add_post.dart';
import 'package:social_media/modules/login_screen/login_screen.dart';
import 'package:social_media/modules/notification_screen/notification_screen.dart';
import 'package:social_media/modules/settings/setting_screen.dart';
import 'package:social_media/modules/user_info/user_info_screen.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
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
                    decoration: BoxDecoration(gradient: linearGradient),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: cubit.isDark
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Colors.white,
                              //Theme.of(context).scaffoldBackgroundColor ,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  'https://images2.habeco.si/upload/images/Blog/6696.jpg'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rafi Shoufan',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: cubit.isDark
                                          ? Colors.white70
                                          : Colors.white,
                                    ),
                          ),
                          Text(
                            'rafishoufan@gmail.com',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: cubit.isDark
                                          ? Colors.white70
                                          : Colors.white,
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
                    color: cubit.isDark ? darkColor : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            title: Text('Save'),
                            leading: Icon(
                              IconBroken.Bookmark,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            title: Text('History'),
                            leading: Icon(
                              Icons.history_toggle_off,
                              // IconBroken.Time_Circle,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SettingScreen(),
                                  ));
                            },
                            title: Text('Settings'),
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
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                  (route) => false);
                            },
                            title: Text('Logout'),
                            leading: Icon(
                              IconBroken.Logout,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: linearGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${cubit.titles[cubit.currentIndex]}',
                  style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                        fontFamily: 'Handmade',
                        fontSize: 40,
                      ),
                ),
              ],
            ),
            actions: [
              Stack(
                alignment: Alignment(-0.5, -0.5),
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ));
                    },
                    icon: Icon(IconBroken.Notification,
                        color: Theme.of(context).appBarTheme.iconTheme!.color),
                    iconSize: 35,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.indigo,
                    radius: 4,
                  )
                ],
              ),
              SizedBox(
                width: 15,
              ),
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
              child:*/
              Stack(
            alignment: Alignment.center,
            children: [
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(IconBroken.Home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(IconBroken.User), label: 'Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(IconBroken.Paper_Plus), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(IconBroken.Chat), label: 'Chats'),
                  BottomNavigationBarItem(
                      icon: Icon(IconBroken.Search), label: 'Search'),
                ],
                onTap: (index) {
                  cubit.changeCurrentIndex(index);
                },
                currentIndex: cubit.currentIndex,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: linearGradient2, shape: BoxShape.circle),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPostScreen(),
                        ));
                  },
                  child: Icon(
                    Icons.add,
                    color: cubit.isDark ? Colors.black45 : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
