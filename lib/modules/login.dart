import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:

               Container(
                height: double.infinity, width: double.infinity,
                decoration: BoxDecoration(
                  gradient: linearGradient
                ),
                /*child:  Image.asset(
                       'assets/images/girl.jpg',
                  fit: BoxFit.fill,
                  color: Colors.white.withOpacity(0.5),
                  colorBlendMode: BlendMode.modulate,
                   ),*/
                 child:Padding(
                   padding: const EdgeInsets.all(20),
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
                           Text('SIGN IN',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color:Colors.white ),),
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

                             TextFormField(
                               decoration: InputDecoration(
                                   labelText: 'Password',
                                   labelStyle: TextStyle(fontSize: 16.0,),
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
                             ),
                             SizedBox(
                               height: 30,
                             ),
                             TextFormField(
                               decoration: InputDecoration(
                                 labelText: 'Email',
                                   labelStyle: TextStyle(fontSize: 16.0,),
                                   prefixIcon: Icon(IconBroken.Message,color: Colors.white,),
                                   /*border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(20),
                                       borderSide: BorderSide(

                                       color: Colors.white,
                                     )

                                   )*/
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
                             ),
                             SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: (){

                                  },
                                  child: Text(
                                  'forgot password?',style: TextStyle(fontSize: 16,color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                             GestureDetector(
                                onTap: (){

                                },
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 40),
                                 child: Container(
                                   height: 60,
                                   decoration:BoxDecoration(
                                     gradient: linearGradient1,
                                     borderRadius: BorderRadius.circular(30),
                                     color: Colors.white,
                                   ),
                                     child: Center(
                                       child: Text(
                                         'LOGIN',
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

                   ]
                         ),
                       ),
                     ],
                   ),
                 ),

              ),
    );
  }
}
