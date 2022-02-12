import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_demo_app/constants/constant.dart';

import 'package:flutter_demo_app/core/exceptions/exceptions.dart';

class ApiService {
  final String _baseURL = BASE_URL;
  Dio _dio = Dio();

  ApiService({Dio? dio}) {
    _dio = dio ?? Dio(); /// Dependency Injection
    _dio.options.baseUrl = _baseURL;
  }

  Future<dynamic> get(String path) async {
    var responseJson;
    try {
      final response = await _dio.get(_baseURL + path);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on HttpException {
      throw InternalServerErrorException('An error occured while ');
    }
    return responseJson;
  }

  Future<dynamic> post(String path, dynamic data) async {
    var responseJson;
    try {
      final response = await _dio.post(_baseURL + path,
          data: data,
          options: Options()..headers = {'Content-Type': 'application/json'});
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("An error occurred. PLease try again later");
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 404:
        throw NotFoundException(NOT_FOUND_ERROR_MESSAGE);
      case 400:
        throw InvalidRequestException(INVALID_REQUEST_ERROR_MESSAGE);
      case 401:
        throw UnauthorisedException(UNAUTHORIZED_ERROR_MESSAGE);
      case 500:
        throw InternalServerErrorException(SERVER_ERROR_MESSAGE);
      default:
        throw FetchDataException(
            '$FETCH_DATA_EXCEPTION_ERROR_MESSAGE ${response.statusCode}',
        );
    }
  }
}

