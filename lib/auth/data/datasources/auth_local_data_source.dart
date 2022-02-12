import 'dart:convert';

import 'package:flutter_demo_app/auth/models/auth_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void>? cacheUserDetails(AuthInfo authInfo);
}

const CACHED_AUTH_INFO = 'CACHED_NUMBER_TRIVIA';

class AuthLocalDataSourceSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceSourceImpl({required this.sharedPreferences});

  @override
  Future<void>? cacheUserDetails(AuthInfo authInfo) {
    return sharedPreferences.setString(
        CACHED_AUTH_INFO, json.encode(authInfo.toJson()));
  }
}
