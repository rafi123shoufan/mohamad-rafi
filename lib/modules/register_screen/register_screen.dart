import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/modules/register_screen/cubit/register_cubit.dart';
import 'package:social_media/modules/register_screen/cubit/register_states.dart';
import 'package:social_media/modules/user_info/user_info.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

import '../../shared/components/constants.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            return Scaffold(
              body: Container(
                height: double.infinity, width: double.infinity,
                decoration: BoxDecoration(
                  gradient: linearGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 64, left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SIGN UP', style: TextStyle(fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 32,),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*TextFormField(
                              controller: userName,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'user name must not be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'User Name',
                                  labelStyle: TextStyle(fontSize: 16.0,),
                                  prefixIcon: Icon(IconBroken.Profile,
                                    color: Colors.white,),
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
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'user name must not be empty';
                                    }
                                    return null;
                                  },
                                  controller: userNameController,
                                  label: 'Name',
                                  prefixIcon: IconBroken.User,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                /*TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (String value){
                                print(value);
                              },
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'email address must not be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(fontSize: 16.0,),
                                  prefixIcon: Icon(IconBroken.Message,color: Colors.white,),
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
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'email address must not be empty';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    label: 'Email',
                                    prefixIcon: IconBroken.Message),
                                SizedBox(
                                  height: 30,
                                ),
                                /*TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be empty';
                                }
                                return null;
                              },
                              controller: passwordController,
                              obscureText: isPassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 16.0,),
                                prefixIcon: Icon(IconBroken.Lock,
                                  color: Colors.white,),
                                suffixIcon: IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(
                                    isPassword ? IconBroken.Show : IconBroken.Hide,
                                    color: Colors.white,),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    */ /*TextFormField(
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'must not be empty';
                                }
                                if(value!=passwordController.text){
                                  return 'The password is incorrect';
                                }
                                return null;
                              },
                              controller: confirmPasswordController,
                              obscureText: confirmPassword,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(fontSize: 16.0,),
                                prefixIcon: Icon( IconBroken.Lock,color: Colors.white,),
                                suffixIcon:IconButton(
                                  onPressed: (){

                                }, icon: Icon(confirmPassword? IconBroken.Show :IconBroken.Hide,color: Colors.white,),),
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
                            ),*/ /*
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
                            ),*/
                                registerTextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'password must not be empty';
                                      }
                                      return null;
                                    },
                                    controller: passwordController,
                                    label: 'Password',
                                    prefixIcon: IconBroken.Lock,
                                    function: () {
                                      cubit.makePasswordVisible();
                                    },
                                    suffixIcon: cubit.isPassword ? IconBroken
                                        .Hide : IconBroken.Show,
                                    isHidden: cubit.isPassword
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                registerTextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'confirm password not be empty';
                                      }
                                      if (value != passwordController.text) {
                                        return 'The password is incorrect';
                                      }
                                      return null;
                                    },
                                    controller: confirmPasswordController,
                                    label: 'Confirm Password',
                                    prefixIcon: IconBroken.Lock,
                                    function: () {
                                      cubit.makeConfirmPasswordVisible();
                                    },
                                    suffixIcon: cubit.confirmPassword
                                        ? IconBroken.Hide
                                        : IconBroken.Show,
                                    isHidden: cubit.confirmPassword
                                ),

                                SizedBox(height: 25,),
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(
                                            builder: (context) => UserInfoScreen(),),
                                              (route) => false);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        gradient: linearGradient1,
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 28,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an Account?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()), (
                                              Route<dynamic>route) => true,
                                          );
                                        },
                                        child: Text(
                                            'Login',
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: a1)

                                        )),
                                  ],
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
            );
          },
        )
    );
  }
}
