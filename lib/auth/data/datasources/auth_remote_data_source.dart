import 'package:flutter_demo_app/auth/models/auth.dart';
import 'package:flutter_demo_app/auth/models/user_data.dart';
import 'package:flutter_demo_app/core/services/api_service.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<Auth> loginUser(UserData userData);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Auth> loginUser(UserData userData) async {
    Map<String, dynamic> requestBodyJson = userData.toJson();
    try{
      var responseData = await apiService.post('login', requestBodyJson);
      final authModel = Auth.fromJson(responseData);
      return authModel;
    }on Exception catch (e) {
      print(e);
      throw ServerException();
    }
  }

}
