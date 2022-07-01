import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

import 'constants.dart';




LinearGradient  linearGradient = LinearGradient(
colors: [
a,
  a1
],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient  linearGradient3 = LinearGradient(
  colors: [
 //   a7,
 //   a8
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
LinearGradient  linearGradient2 = LinearGradient(
  colors: [
    a,
    a1
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient  linearGradient1 = LinearGradient(
    colors: [
      pink3,
      pink,
      pink2,

    ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
    stops: [0.2,0.1,0.9]
);


AppBar defaultAppBar({
   required BuildContext context,
  required String text,
  required var cubit,
    required Function function  ,
   IconData  icon = IconBroken.Arrow___Left ,
    Widget ? action
})
{
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: linearGradient
      ),
    ),
    title: Text(
      '${text}',
      style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
        fontFamily: 'Handmade' ,
        fontSize: 40,
        color: cubit.isDark? Colors.black : Colors.white,
      ),
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness:  Brightness.light,
        statusBarColor: Colors.transparent
    ),
    leading: IconButton(
        onPressed: (){
          function();
        }, icon: Icon(
      icon,
      color: cubit.isDark? Colors.black : Colors.white,
    )
    ),
    actions: [
      action?? SizedBox(),
      SizedBox(
          width: 15
      ),
    ],
  );
}

Widget myTextFormField({
  required Function function,
  TextStyle style = const TextStyle(
    color: a1
  ),
  OutlineInputBorder enabledBorder = const OutlineInputBorder(
      borderSide: BorderSide(
          color: a
      )
  ),
  OutlineInputBorder focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(
          color: a
      )
  ),
  required IconData prefix,
  required String text
}
)
{
  return TextFormField(
    validator: (value){
      function();
    },
    style: style,
    decoration: InputDecoration(
        enabledBorder : enabledBorder,
        focusedBorder: focusedBorder,
        prefixIcon: Icon(
          prefix ,
          color: a,
        ),
        label: Text(
          text,
          style: TextStyle(
              color: a1
          ),
        )
    ),
  );
}



Widget searchTextFormField(
{
  required var cubit ,
  required String text,
  required context,
  required IconData icon
}
    ){
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cubit.isDark? darkCardColor: Colors.white,
      ),
      child: TextFormField(
        minLines: 1,
        maxLines: 6,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: Theme.of(context).textTheme.bodyText2,
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),

  );
}



Widget registerTextFormField({
  required FormFieldValidator validator,
  required TextEditingController controller,
  bool isHidden = true,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
   Function ?function,
  required TextInputType keyboardType
}){
  return TextFormField(
    keyboardType: keyboardType,
  validator: validator,
  controller: controller,
  obscureText: isHidden,
  decoration: InputDecoration(
  labelText: label,
  labelStyle: TextStyle(fontSize: 16.0,color: Colors.white),
  prefixIcon: Icon( prefixIcon,color: Colors.white,),
  suffixIcon:IconButton(
  onPressed: (){
    function!();
  }, icon: Icon(suffixIcon,color: Colors.white,),),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
borderSide: BorderSide(
color: Colors.white
),
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
borderSide: BorderSide(
color: Colors.white
),
),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
        color: Colors.red
    ),
  ),
),
  );
}


void showToast(String message , ToastStates state){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastStates {
  Success,
  Error,
  Warning
}

Color chooseToastColor(ToastStates state){
  switch(state){
    case ToastStates.Success :
      return Colors.green;
      break;
    case ToastStates.Warning :
      return Colors.yellow;
      break;
    case ToastStates.Error :
      return Colors.red;
      break;
  }
}
