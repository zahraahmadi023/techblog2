import 'dart:math';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';

class DioService{
  Future<dynamic> getMethods(String url)async{
    Dio dio = Dio();//////////ertebat ba server 
    ///for request baed header taeen beshan headerha az postman moshakhas mish 
    dio.options.headers['content-type']='application/json';
    return dio.get(url,
    options: Options(responseType: ResponseType.json,method: "GET")).then((response) {
    developer.log(response.toString());
      return response;

    });

  }


}