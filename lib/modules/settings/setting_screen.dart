import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/layout/layout_screen.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
              context: context,
              text: 'Settings',
              cubit: cubit,
              function: (){
                Navigator.pop(context);
              },
              action: SizedBox(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 30
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 3.0 ,
                      top: 3
                  ),
                  child: Text(
                    'Manage your account !',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Row(
                      children: [
                        Icon(
                            IconBroken.Add_User
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add a new account',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(

                          ),
                            textAlign: TextAlign.start,

                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                 GestureDetector(
                   onTap: (){

                   },
                   child: Row(
                     children: [
                       Icon(
                         IconBroken.Delete
                       ),
                       SizedBox(
                         width: 5,
                       ),
                       Text(
                          'Delete my account',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          ),
                        ),
                     ],
                   ),
                 ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.7,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Theme',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 30
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0 , top: 3),
                  child: Text(
                    'choose a Theme !',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    cubit.changeAppMode();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.brightness_2_outlined
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          'DarkMode',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.7,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Preferences',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 30
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0 , top: 3),
                  child: Text(
                    'add a preference !',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Row(
                    children: [
                      Icon(
                          IconBroken.Notification
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Notifications',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.7,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
