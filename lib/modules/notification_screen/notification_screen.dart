import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
            appBar: defaultAppBar(
                context: context,
                text: 'Notifications',
                cubit: cubit,
                function:(){
                  Navigator.pop(context);
                },
            ),
            body: Padding(
        padding: const EdgeInsets.all(20),
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
                      child: RichText(
                          text: TextSpan(
                            text: 'Rafi Shoufan ',
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                            children: [
                              TextSpan(
                                text: 'Commented on your post',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 17
                                )
                              )
                            ]
                          ),

                      ),
                    ) ,
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
                      child: RichText(
                        text: TextSpan(
                            text: 'Rafi Shoufan ',
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                            children: [
                              TextSpan(
                                  text: 'Reacted to your comment',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 17
                                  )
                              )
                            ]
                        ),

                      ),
                    ) ,
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
