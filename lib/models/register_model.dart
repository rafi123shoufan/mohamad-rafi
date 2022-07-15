class RegisterModel{
  bool ? status;
  String ? message;
  RegisterDataModel ? data;
  RegisterModel.fromjson(Map<String,dynamic>json){
    status = json['status'];
    message = json['message'];
    data = json['data']!= null ? RegisterDataModel.fromjson(json['data']) : null ;
    print('model');
    print(status);
  }
}


class RegisterDataModel{
  String ? name;
  String ? email;
  String ? password;
  int ? id;
  RegisterDataModel.fromjson(Map<String,dynamic>json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }
}
