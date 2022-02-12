import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_demo_app/core/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import '../../test_constants.dart';


void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  var baseUrl = 'https://11ag8nsafg.execute-api.ap-southeast-1.amazonaws.com/dev/';

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
  });

  group('- ApiService class methods test', () {
    group('- Get Method', () {
      test('- Get Method Success test', () async {

        dioAdapter.onGet(
          '$baseUrl$testPath',
              (request) {
            return request.reply(200, successMessage);
          },
          data: null,
          queryParameters: {},
          headers: {},
        );

        final service = ApiService(
          dio: dio,
        );

        final response = await service.get('test');

        expect(response, successMessage);
      });
    });

    group('- Post Method', () {
      test('- Post Method Success test', () async {

        dioAdapter.onPost(
          '$baseUrl$testPath',
              (request) {
            return request.reply(201, successMessage);
          },
          data: json.encode(testData),
          queryParameters: {},
          headers: header,
        );


        final service = ApiService(
          dio: dio,
        );

        final response = await service.post('test', json.encode(testData));

        expect(response, successMessage);
      });
    });
  });
}
