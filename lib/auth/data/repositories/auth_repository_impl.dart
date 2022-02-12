import 'package:flutter_demo_app/auth/models/auth.dart';

import 'package:flutter_demo_app/auth/models/user_data.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../../../core/error/failures.dart';

import 'package:flutter_demo_app/auth/repo/auth_service.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthService {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Auth>> login(UserData userData) async{
    if (await networkInfo.isConnected) {
      try {
        final remoteAuth = await remoteDataSource.loginUser(userData);
        // localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteAuth);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
