import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'http://192.168.1.105:8000/',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept': 'application/json',
            'Content-Type':'application/json'
          }
        )
    );
  }


    static Future<Response> postData({
      required String url,
      Map<String,dynamic> ? query,
      required Map<String,dynamic> data,
      String ? token,
    }) async{
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type':'application/json',
      'Authorization' : token
    };
      return await dio.post(
        url,
        options:  Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      ),
        queryParameters: query,
        data: data,
      );
    }

    static Future<Response> getData({
      required String url,
      Map<String, dynamic> ?  query,
      String ? token,
    }) async{
      dio.options.headers = {
        'Accept': 'application/json',
      'Content-Type':'application/json',
        'Authorization' : token
      };
      return await dio.get(
          url,
          queryParameters: query
      );
    }
  }
