class LoginModel{
   bool ? status;
   String ? message;
  String ? access_token;
  LoginModel.fromjson(Map<String,dynamic>json){
    status = json['status'];
    message = json['message'];
    access_token = json['access_token'];
  }
}
