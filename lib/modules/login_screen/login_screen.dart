import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media/layout/layout_screen.dart';
import 'package:social_media/modules/login_screen/cubit/login_cubit.dart';
import 'package:social_media/modules/login_screen/cubit/login_states.dart';
import 'package:social_media/modules/register_screen/register_screen.dart';
import 'package:social_media/modules/user_info/user_info.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/network/local/cache_helper.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              showToast(state.loginModel.message, ToastStates.Success);
              CacheHelper.saveData(
                  key: 'access_token', value: state.loginModel.access_token
              )
                  .then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LayoutScreen(),),
                        (route) => false
                );
              });
            } else {
              showToast(state.loginModel.message, ToastStates.Error);
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(gradient: linearGradient),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    /*mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,*/
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SIGN IN',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /* TextFormField(
                                     decoration: InputDecoration(
                                         labelText: 'Email',
                                         prefixIcon:Icon(Icons.email,color: Colors.white,),
                                         labelStyle: TextStyle(color: Colors.white),
                                         enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.white,
                                             )
                                         )
                                     ),
                                   ),
                                   SizedBox(height: 30,),
                                   TextFormField(
                                     decoration: InputDecoration(
                                         labelText: 'Password',
                                         prefixIcon:Icon(Icons.remove_red_eye,color: Colors.white,),
                                         labelStyle: TextStyle(color: Colors.white),
                                         enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.white,
                                             )
                                         )
                                     ),
                                   ),*/
                              /*  Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20),
                                        color: Colors.white70,

                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                       child: TextFormField(
                                         decoration: InputDecoration(
                                           border: InputBorder.none,
                                           hintText: 'Email',
                                           hintStyle: TextStyle(
                                             fontSize: 20,
                                             color: Colors.white
                                           ),
                                           prefixIcon: Icon(
                                             Icons.email,
                                             color: Colors.white,
                                           )
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20),
                                       color: Colors.white70,
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                       child: TextFormField(
                                         decoration: InputDecoration(
                                             border: InputBorder.none,
                                             hintText: 'Email',
                                             hintStyle: TextStyle(
                                                 fontSize: 20,
                                               color: Colors.white
                                             ),
                                             prefixIcon: Icon(
                                                 Icons.email,
                                               color: Colors.white,
                                             )
                                         ),
                                       ),
                                     ),
                                   ),*/
                              /* TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'dcvdv',
                                labelStyle: TextStyle(fontSize: 16.0,color: Colors.white),
                                prefixIcon: Icon(IconBroken.Lock,color: Colors.white,),
                                suffixIcon: Icon(IconBroken.Hide,color: Colors.white,) ,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                  color: a1
                              ),
                            ),*/
                              registerTextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'email must not be empty';
                                    }
                                  },
                                  controller: emailController,
                                  label: 'Email',
                                  prefixIcon: IconBroken.Message,
                                  keyboardType: TextInputType.emailAddress,
                                  isHidden: false
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              /*TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(fontSize: 16.0,),
                                  prefixIcon: Icon(
                                    IconBroken.Message, color: Colors.white,),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(

                                        color: Colors.white,
                                      )

                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.white
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.white
                                      )
                                  )
                              ),
                            ),*/
                              registerTextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'password must not be empty';
                                    }
                                  },
                                  controller: passwordController,
                                  label: 'Password',
                                  prefixIcon: IconBroken.Lock,
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixIcon: cubit.isPassword
                                      ? IconBroken.Hide
                                      : IconBroken.Show,
                                  isHidden: cubit.isPassword,
                                  function: () {
                                    cubit.makePasswordVisible();
                                  }),
                              SizedBox(
                                height: 25,
                              ),
                              ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                  builder: (context) =>
                                      GestureDetector(
                                        onTap: () {
                                          if (formKey.currentState!.validate()) {
                                            cubit.userLogin(
                                                email: emailController.text,
                                                password: passwordController.text
                                            );
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                              gradient: linearGradient1,
                                              borderRadius: BorderRadius
                                                  .circular(30),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'LOGIN',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  fallback: (context) => Center(
                                    child: CircularProgressIndicator(),)
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don\’t have an Account ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()),
                                              (Route<dynamic> route) => true,
                                        );
                                      },
                                      child: Text('Register',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: a1))),
                                ],
                              ),
                              /*  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       ElevatedButton(style:ElevatedButton.styleFrom(
                                         padding: EdgeInsets.symmetric(horizontal: 70,vertical: 20),
                                         primary: Colors.purple,
                                         fixedSize: Size(275,60),
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(50)
                                         ),

                                       ) ,


                                           onPressed: (){},

                                           child: Text(
                                             'LOGIN',
                                             style: TextStyle(
                                                 fontSize: 18,
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.bold
                                             ),
                                             textAlign: TextAlign.center,
                                           )

                                       ),
                                     ],
                                   ),*/
                            ]),
                      ),
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
