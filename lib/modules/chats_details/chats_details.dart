import 'package:flutter/material.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class ChatsDetailsSreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:NetworkImage(
                'https://menshaircuts.com/wp-content/uploads/2019/06/business-casual-men-dress-code-history.jpg',
              ),
              radius: 20,
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
                      borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'type your message here...',
                        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: MaterialButton(
                      minWidth: 1,
                      color: Colors.blue,
                      onPressed: (){

                  }, child: Icon(
                      IconBroken.Send,
                  color: Colors.white,
                   )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
