import 'package:flutter/material.dart';
import 'package:social_media/modules/chats_details/chats_details.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
         physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => myChatFriend(context),
          separatorBuilder:  (context, index) => Divider(
            height: 2,
            color: Colors.grey,
          ),
          itemCount: 10
      )
    );
  }


  myChatFriend(context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatsDetailsSreen(),));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
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
                    Text('Rafi Shoufan' , style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    ),
                  ],
                ),
              ],
            ) ,
          ],
        ),
      ),
    ) ;
  }
}
