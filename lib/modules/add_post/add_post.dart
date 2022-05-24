import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage('assets/images/11.jpg') ,
        width: double.infinity,
          height: 225,
          fit: BoxFit.cover,
        ),
        Column(
          children: [

          ],
        )

      ],
    );
  }
}
