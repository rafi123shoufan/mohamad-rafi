import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class ChatsDetailsSreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: linearGradient
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness:  Brightness.light,
                statusBarColor: Colors.transparent
            ),
              titleSpacing: 0,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:NetworkImage(
                      'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
                    ),
                    radius: 23,
                  ) ,
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Rafi Shoufan' , style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                            fontFamily: 'Handmade' ,
                            fontSize: 35,
                            color: cubit.isDark? Colors.black : Colors.white,
                          ),
                          ),
                        ],
                      ),
                    ],
                  ) ,
                ],
              ),
              leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(
                IconBroken.Arrow___Left,
                color: cubit.isDark ? Colors.black : Colors.white,
              )
              ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hello ' ,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )
                    ),
                    child: Text(
                      'Hello There' ,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
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
