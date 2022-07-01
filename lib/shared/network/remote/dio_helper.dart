import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(

          baseUrl: 'http://192.168.1.108:8000/',
          receiveDataWhenStatusError: true,

        )
    );
  }

  static Future<Response> postData({
    required String url,
     Map<String,dynamic> ? query,
    required Map<String,dynamic> data
  }) async {
    dio.options.headers = {

        'Accept': 'application/json',
        'Content_Type':'application/json'

    };
    return await dio.put(
        url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getData({
  required String url,
    Map<String, dynamic> ?  query
}) async{
    return await dio.get(
      url,
      queryParameters: query
    );
  }
}