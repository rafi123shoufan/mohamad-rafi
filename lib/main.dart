import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/layout/layout_screen.dart';
import 'package:social_media/models/login_models.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/network/local/cache_helper.dart';
import 'package:social_media/shared/network/remote/dio_helper.dart';
import 'modules/edit_profile/edit_profile_screen.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/on_boarding_screen/on_boarding_screen.dart';
import 'modules/profile/profile.dart';
import 'modules/register_screen/register_screen.dart';
import 'modules/user_info/user_info_screen.dart';
import 'shared/components/constants.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp( MyApp() );
  String token = CacheHelper.getData('access_token');
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit , LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: cubit.isDark ? ThemeMode.dark: ThemeMode.light,
            theme: ThemeData(
              primarySwatch: Colors.pink,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              textTheme: TextTheme(
                subtitle2:  TextStyle(
                    color: Colors.black,
                    height: 1.5,
                  fontWeight: FontWeight.bold
                ),
                subtitle1:  TextStyle(
                    color: Colors.black,
                    height: 1.5
                ),
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  height: 1.4,
                  fontWeight: FontWeight.bold
                ),
                  bodyText2: TextStyle(
                    color: Colors.black,
                  )
              ),

              appBarTheme: AppBarTheme(
                actionsIconTheme: IconThemeData(
                  color: Colors.white,
                  size: 30,
                ),
              //  titleSpacing: 15,
                color: Colors.white,
                iconTheme:  IconThemeData(
                  color: Colors.white,
                  size: 30
                ),
                titleTextStyle: TextStyle(
                    color:Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: Colors.transparent
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedIconTheme: IconThemeData(
                    size: 40
                  ),
                  unselectedIconTheme: IconThemeData(
                    size: 30
                  ),
                  selectedItemColor: a1,

                  unselectedItemColor: a,
                  selectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                elevation: 30,
                  sizeConstraints: BoxConstraints(
                      minHeight: 58,
                      minWidth: 58
                  ),
                backgroundColor: Colors.transparent
              ),
              scaffoldBackgroundColor: Colors.white,
            ),






            darkTheme: ThemeData(
              primarySwatch: Colors.pink,
              iconTheme: IconThemeData(
                color: Colors.grey
              ),
              textTheme: TextTheme(
                subtitle2: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                    fontWeight: FontWeight.bold
                ),
                subtitle1:  TextStyle(
                    color: Colors.white,
                    height: 1.5
                ),
                  bodyText1: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.bold
                  ),
                bodyText2: TextStyle(
                  color: Colors.white,
                )
              ),
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                    color:Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
                iconTheme: IconThemeData(
                    color: Colors.black,
                    size: 30
                ),
             //   titleSpacing: 15,
                color: darkColor,
                actionsIconTheme: IconThemeData(
                    color: Colors.black,
                    size: 30
                ),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: Colors.transparent
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  elevation: 30,
                 sizeConstraints: BoxConstraints(
                   minHeight: 58,
                   minWidth: 58
                 ),
                  backgroundColor: Colors.transparent
              ),
              scaffoldBackgroundColor: darkColor,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(
                    size: 40 ,
                ),
                selectedItemColor: a1,
                unselectedIconTheme: IconThemeData(
                  size: 30 ,
                ),
                elevation: 0,
             //   backgroundColor: d1,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                unselectedItemColor:a
              ),
            ),
            home:  LoginScreen(),
          );
        },
      ),
    );
  }
}






