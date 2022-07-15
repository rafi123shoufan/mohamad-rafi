import 'package:flutter/material.dart';

class UserInfoModel{
  bool ? status;
  String ? message;
  UserInfoDataModel ? data;
  UserInfoModel.fromjson(Map<String,dynamic>json){
    print('user info constractur');
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserInfoDataModel.fromjson(json['data']):null ;
    print('end of user info constractur');
  }
}

class UserInfoDataModel {
  String ? birthdate;
  String ? gender;
  String ? lived;
  String ? Job;
  String ? studing;
  String ? bio;
  FileImage ? Image;
  FileImage ? Image_cover;
  UserInfoDataModel.fromjson(Map<String,dynamic>json){
    print('start UserInfoDataModel constarctor');
    birthdate = json['birthdate'];
    gender = json['gender'];
    lived = json['lived'];
    Job = json['Job'];
    studing = json['studing'];
    bio = json['bio'];
    Image = json['Image'];
    Image_cover = json['Image_cover'];
    print('end UserInfoDataModel constarctor');
  }
}

