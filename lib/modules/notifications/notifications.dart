import 'package:flutter/material.dart';
import 'package:social_media/shared/components/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: b,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: b1
              ),
              child: TextFormField(
                decoration: InputDecoration(
                   label: Text(
                     'Email '
                   ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold

                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(

                    ),
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}