// Mocks generated by Mockito 5.0.17 from annotations
// in flutter_demo_app/test/auth/data/datasources/auth_remote_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:dio/dio.dart' as _i4;
import 'package:flutter_demo_app/core/services/api_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i2.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> get(String? path) =>
      (super.noSuchMethod(Invocation.method(#get, [path]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> post(String? path, dynamic data) =>
      (super.noSuchMethod(Invocation.method(#post, [path, data]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  dynamic returnResponse(_i4.Response<dynamic>? response) =>
      super.noSuchMethod(Invocation.method(#returnResponse, [response]));
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesForTest extends _i1.Mock implements _i2.ApiService {
  @override
  _i3.Future<dynamic> get(String? path) =>
      (super.noSuchMethod(Invocation.method(#get, [path]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> post(String? path, dynamic data) =>
      (super.noSuchMethod(Invocation.method(#post, [path, data]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  dynamic returnResponse(_i4.Response<dynamic>? response) =>
      super.noSuchMethod(Invocation.method(#returnResponse, [response]));
}
