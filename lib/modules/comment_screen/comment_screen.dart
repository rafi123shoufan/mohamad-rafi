import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/layout/layout_screen.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(

      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
              text:'Add Comment',
              function: (){
                Navigator.pop(context);
              },
              action: SizedBox(),
            cubit: cubit,
            context: context
          ),
          /*appBar: AppBar(
            title: Text(
              'Add Comment',
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
          ),*/
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:NetworkImage(
                        'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
                      ),
                      radius: 28,
                    ) ,
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                    text: 'Rafi Shoufan ',
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                    children: [
                                      TextSpan(
                                        text:'this is so funthis is so funthis is so funthis is so funthis is so funthis is so funthis is so funthis is so funthis is so funthis is so fun' ,
                                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                            fontWeight: FontWeight.w400,
                                          fontSize: 16
                                        ),
                                      )
                                    ]
                                  ),
                              ),

                              Row(
                                children: [
                                  Text(
                                    '15 h',
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Colors.grey
                                    ),
                                  ),
                                  Spacer(),
                                   InkWell(
                                     onTap: (){

                                     },
                                     child: Icon(
                                        IconBroken.Heart,
                                      color: Colors.red,
                                  ),
                                   ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                      '456'
                                  ),
                                ],
                              ),
                            ],
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:NetworkImage(
                        'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
                      ),
                      radius: 28,
                    ) ,
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                     text: 'Rafi Shoufan ',
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'this is so interisting ',
                                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                            fontWeight: FontWeight.w400,
                                          fontSize: 16
                                        ),
                                      )
                                    ]
                                  ),

                              ),
                              Row(
                                children: [
                                  Text(
                                    '15 h',
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                        color: Colors.grey
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: (){

                                    },
                                    child: Icon(
                                      IconBroken.Heart,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                      '456'
                                  ),
                                ],
                              ),
                            ],
                          ),

                    ),
                  ],
                ),

                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.grey.shade500,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Add a comment...',
                            hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                          minLines: 1,
                          maxLines: 3,
                        ),
                      ),
                    ),

                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: a
                      ),
                      height: 50,
                       child: Icon(
                        IconBroken.Send,
                        color: Colors.white,
                      )
                      ),

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
