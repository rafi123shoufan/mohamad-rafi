import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media/layout/layout_cubit/layout_cubit.dart';
import 'package:social_media/layout/layout_cubit/layout_states.dart';
import 'package:social_media/modules/comment_screen/comment_screen.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class PersoneProfileScreen extends StatelessWidget {
  const PersoneProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: /*AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: cubit.isDark? Brightness.light : Brightness.dark,
                statusBarColor: Colors.transparent
            ),
            title: Text(
              'Rafi Shoufan',
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                fontFamily: 'Handmade' ,
                fontSize: 40,
                color: cubit.isDark? Colors.white : Colors.black,
              ),
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
          defaultAppBar(
            context: context,
            text: 'Rafi Shoufan',
            cubit: cubit,
            function: () {
              Navigator.pop(context);
            },
            action: SizedBox(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 270,
                    child: Stack(
                      children: [
                        Container(
                          height: 190,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // gradient: linearGradient,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/14.jpeg',
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  'https://images2.habeco.si/upload/images/Blog/6696.jpg'),
                            ),
                          ),
                        ),
                        /* Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                            child: ClipOval(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48),
                                  child: Image.network('https://images2.habeco.si/upload/images/Blog/6696.jpg',
                                  fit: BoxFit.cover,),
                                )
                            ),
                          )*/
                      ],
                    ),
                  ),
                  Text(
                    'Rafi Shoufan',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(
                        fontSize: 27
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '156',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Photos',
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '3K',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Following',
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: cubit.isDark ? Colors.white70 : Colors
                                      .black12
                              )
                          ),
                          onPressed: () {

                          },
                          child: Text(
                            'Add Friend',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                            onPressed: () {

                            },
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: cubit.isDark ? Colors.white70 : Colors
                                        .black12
                                )
                            ),
                            child: Text(
                              'Follow',
                            )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Icon(
                        IconBroken.Location,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                            text: TextSpan(
                          text: 'Lives In ',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                              fontSize: 18,
                              color: cubit.isDark ? Colors.white : Colors.black
                          ),
                          children: [
                            TextSpan(
                              text: 'Damascus',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: cubit.isDark ? Colors.white : Colors.black
                              ),
                            )
                          ]
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Icon(
                        IconBroken.Call,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: RichText(text: TextSpan(
                            text: 'Phone ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                fontSize: 18,
                                color: cubit.isDark ? Colors.white : Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: '0931482245',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cubit.isDark ? Colors.white : Colors.black
                                ),
                              )
                            ]
                        )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        IconBroken.Filter_2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: RichText(
                            text: TextSpan(
                            text: 'Studying ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                fontSize: 18,
                                color: cubit.isDark ? Colors.white : Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: 'Faculty of Information Technology',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cubit.isDark ? Colors.white : Colors.black
                                ),
                              )
                            ]
                        )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Icon(
                        IconBroken.Document,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: RichText(text: TextSpan(
                            text: 'Bio ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                fontSize: 18,
                                color: cubit.isDark ? Colors.white : Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: 'Software Engineer Leader ',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cubit.isDark ? Colors.white : Colors.black
                                ),
                              )
                            ]
                        )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Icon(
                        IconBroken.Work,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: RichText(
                            text: TextSpan(
                            text: 'Job ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                fontSize: 18,
                                color: cubit.isDark ? Colors.white : Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: 'IT Manager',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cubit.isDark ? Colors.white : Colors.black
                                ),
                              )
                            ]
                        )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Icon(
                        IconBroken.User1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: RichText(text: TextSpan(
                            text: 'Gender ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                fontSize: 18,
                                color: cubit.isDark ? Colors.white : Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: 'Male ',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cubit.isDark ? Colors.white : Colors.black
                                ),
                              )
                            ]
                        )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 0.75,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  SizedBox(
                   height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Posts',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 35 ,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  myPost(context)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget myPost(context) {
    var pageController = PageController();
    var cubit = LayoutCubit.get(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: cubit.isDark ? darkCardColor : Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
                  ),
                  radius: 28,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PersoneProfileScreen(),
                                )
                            );
                          },
                          child: Text(
                            'Rafi Shoufan',
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              color: cubit.isDark ? Colors.white : Colors.black
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          child: Icon(Icons.check, size: 10,),
                          radius: 7,
                        )
                      ],
                    ),
                    Text('January 21,2021 at 11:00 pm', style: Theme
                        .of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(
                        color: Colors.grey
                    ),)
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    IconButton(onPressed: () {

                                    }, icon: Icon(IconBroken.Bookmark)
                                    ),
                                    Text(
                                        'Save'
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: () {

                                    }, icon: Icon(IconBroken.Edit_Square)
                                    ),
                                    Text(
                                        'Edit'
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: () {

                                    }, icon: Icon(IconBroken.Delete)
                                    ),
                                    Text(
                                        'Delet'
                                    ),
                                  ],
                                ),

                                TextButton(
                                    onPressed: () {
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
            ),
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
                child: Text(
                  'We are going to conquer the social media community , we will make people forget about facebook and other social media apps '
                      'because we have Rafi with us رافي لديكم فلا خوف عليكم ',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
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
                controller: pageController,
                itemBuilder: (context, index) => myPhoto(),
                physics: BouncingScrollPhysics(),
                itemCount: 5,
              ),
            ),
            SizedBox(height: 10,),

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
                          Icon(IconBroken.Heart, color: Colors.red,),
                          SizedBox(width: 10,),
                          Text('15', style: Theme
                              .of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                              color: Colors.grey,
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
                          Icon(IconBroken.Chat, color: Colors.amberAccent,),
                          SizedBox(width: 10,),
                          Text('10 comment', style: Theme
                              .of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                              color: Colors.grey,
                              fontSize: 15
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [

                  InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
                          ),
                          radius: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Write a comment ...', style: Theme
                            .of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(
                            color: Colors.grey,
                            fontSize: 15
                        )
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentScreen(),
                          )
                      );
                    },
                  ),
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(IconBroken.Heart, color: Colors.red,),
                          SizedBox(width: 10,),
                          Text('Like', style: Theme
                              .of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                              color: Colors.grey,
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
    );
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

