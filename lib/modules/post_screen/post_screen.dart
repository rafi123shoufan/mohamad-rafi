import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/modules/comment_screen/comment_screen.dart';
import 'package:social_media/modules/persone_profile/persone_profile.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

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
              text: 'Post',
              cubit: cubit,
              function: (){
                Navigator.pop(context);
              },
              icon: IconBroken.Arrow___Left,
              action: SizedBox()
          ),
          body: Column(
            children: [
              myPost(context)
            ],
          ),
        );
      },
    );
  }
  Widget myPost(context) {
    var pageController = PageController();
    var cubit = LayoutCubit.get(context);
    return Expanded(
      child: Card(

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 10,
        color: cubit.isDark ? darkCardColor : Colors.white ,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:(context) => PersoneProfileScreen(),
                                  )
                              );
                            },
                            child: Text(
                              'Rafi Shoufan' ,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            child: Icon(Icons.check , size: 10,),
                            radius: 7,
                          )
                        ],
                      ),
                      Text('January 21,2021 at 11:00 pm' , style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.grey
                      ),)
                    ],
                  ) ,
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){

                                  }, icon: Icon(IconBroken.Bookmark)
                                  ),
                                  Text(
                                      'Save'
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){

                                  }, icon: Icon(IconBroken.Edit_Square)
                                  ),
                                  Text(
                                      'Edit'
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){

                                  }, icon: Icon(IconBroken.Delete)
                                  ),
                                  Text(
                                      'Delet'
                                  ),
                                ],
                              ),

                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text(
                                  'Done'
                              )
                              ),
                              /*Row(
                                children: [
                                  TextButton(
                                      onPressed: (){

                                  }, child: Text(
                                    'Cancel'
                                  )
                                  ),
                                  Spacer(),
                                  TextButton(
                                      onPressed: (){

                                      }, child: Text(
                                      'Ok'
                                  )
                                  ),
                                ],
                              ),*/
                            ],
                          ),
                        );
                      }, icon: Icon(Icons.more_horiz)
                    //icon:  Icon(IconBroken.More_Square , color: Colors.white60,),
                  )
                ],
              ) ,
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  child: Text('We are going to conquer the social media community , we will make people forget about facebook and other social media apps '
                      'because we have Rafi with us رافي لديكم فلا خوف عليكم ',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.start,
                  )
              ),
              SizedBox(height: 10,),
              Container(
                height: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                child: PageView.builder(
                  controller: pageController ,
                  itemBuilder: (context, index) => myPhoto(),
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                ),
              ),
              SizedBox(height: 20,),

              SmoothPageIndicator(
                controller: pageController,
                count: 5,
                /*effect: ExpandingDotsEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                  expansionFactor: 2.2
                ),*/
                effect: SwapEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                  spacing: 5,
                  //  verticalOffset: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Row(
                          children: [
                            Icon(IconBroken.Heart , color: Colors.red,),
                            SizedBox(width:10 ,),
                            Text('15' , style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color:Colors.grey,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(IconBroken.Chat , color: Colors.amberAccent,) ,
                            SizedBox(width:10 ,),
                            Text('10 comment' , style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color:Colors.grey,
                                fontSize: 15
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,
              SizedBox(
                height:   15,
              ),
              Divider(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height:   15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [

                    InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:NetworkImage(
                              'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
                            ),
                            radius: 20,
                          ) ,
                          SizedBox(
                            width: 15,
                          ),
                          Text('Write a comment ...' , style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color:Colors.grey,
                              fontSize: 15
                          )
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:(context) => CommentScreen(),
                            )
                        );
                      },
                    ),
                    Expanded(
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(IconBroken.Heart , color: Colors.red,),
                            SizedBox(width:10 ,),
                            Text('Like' , style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color:Colors.grey,
                                fontSize: 14
                            )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ) ;
  }

  Widget myPhoto() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image(
          height: 300,
          image:AssetImage(
            'assets/images/girl.jpg' ,
          ),
        ),
      ),
    );
  }
}
