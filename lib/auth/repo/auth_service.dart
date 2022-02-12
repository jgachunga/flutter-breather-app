import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/auth/models/auth.dart';
import 'package:flutter_demo_app/auth/models/user_data.dart';
import 'package:flutter_demo_app/core/error/failures.dart';

abstract class AuthService {
  Future<Either<Failure, Auth>> login(UserData userData);
}
