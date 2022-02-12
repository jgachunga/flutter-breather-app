import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/auth/models/auth.dart';
import 'package:flutter_demo_app/auth/models/user_data.dart';
import 'package:flutter_demo_app/auth/repo/auth_service.dart';
import 'package:flutter_demo_app/core/error/failures.dart';

class AuthViewModel extends ChangeNotifier {
  //
  bool _loading = false;
  final AuthService authService;
  late Failure _failure;
  Failure get failure => _failure;
  late Either<Failure, Auth> _auth;
  Either<Failure, Auth> get auth => _auth;

  bool get loading => _loading;

  AuthViewModel({required this.authService});

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  void _setAuth(Either<Failure, Auth> auth) {
    _auth = auth;
    notifyListeners();
  }

  loginUser(userData) async {
    await authService.login(userData);
    notifyListeners();
    return true;
  }
}
