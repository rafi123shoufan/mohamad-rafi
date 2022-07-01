

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/components.dart';

import '../login_screen/login_screen.dart';



class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image, required this.title, required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(image: 'assets/images/world.png',
        title: 'Communication',
        body: 'Increase your social relations by publishing posts, interacting with friends posts, meeting friends from all over the world'),
    BoardingModel(image: 'assets/images/learning.png',
        title: 'Learning',
        body: 'Increase your knowledge and discover your capabilities.'),
    BoardingModel(image: 'assets/images/chat2.png',
        title: 'Chatting',
        body: 'Stay in touch with your friends, family and people around you by messaging.')
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) =>  LoginScreen()),(Route<dynamic>route)=> false,
            );
          }, child: Text('SKIP',style: TextStyle(fontSize: 20,color: Color(0xffc2185b)),),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index){
                  if (index==boarding.length  -1){
                    setState(() {
                      isLast=true;
                    });
                    print('last');
                  }
                  else{

                    setState(() {
                      isLast=false;
                    });
                    print('not last');
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController, count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    activeDotColor: Color(0xffc2185b),
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(

                  backgroundColor:Color(0xffc2185b),
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) =>  LoginScreen()),(Route<dynamic>route)=> false,
                      );
                    } else {
                      boardController.nextPage(duration: Duration(
                        microseconds: 750,
                      ), curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
                image: AssetImage('${model.image}'),
              )),
          Text('${model.title}', style: TextStyle(
            fontSize: 24.0,
          ),),
          SizedBox(height: 15,),
          Text('${model.body}', style: TextStyle(
            fontSize: 14.0,
              color: Colors.grey
          ),),
          SizedBox(height: 15,),
        ],
      );
}
