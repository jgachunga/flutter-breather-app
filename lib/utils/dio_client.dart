import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_demo_app/models/auth.dart';
import 'package:flutter_demo_app/models/index.dart';
import 'package:flutter_demo_app/utils/logging.dart';

class DioClient {

    final Dio _dio = Dio(
      BaseOptions(
        baseUrl:
        'https://11ag8nsafg.execute-api.ap-southeast-1.amazonaws.com/dev',
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ),
    )..interceptors.add(Logging());



  Future<Auth?> createUser(
      {required String username, required String password}) async {
    Auth? retrievedUser;


    String requestBodyJson =
        json.encode({'username': username, 'password': password});

    try {
      Response response = await _dio.post('/login',
          data: requestBodyJson,
          options: Options(headers: {
            'Accept': 'application/json',
          }));

      print('User created: ${response.data}');
      print('User status code: ${response.statusCode}');

      retrievedUser = Auth.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }
}
