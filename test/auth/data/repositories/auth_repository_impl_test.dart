
import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_demo_app/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_demo_app/auth/models/auth.dart';
import 'package:flutter_demo_app/auth/models/user_data.dart';
import 'package:flutter_demo_app/core/network/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([
  NetworkInfo,
  AuthRemoteDataSource
], customMocks: [
  MockSpec<AuthRemoteDataSource>(
      as: #MockNumberTriviaRemoteDataSourceForTest,
      returnNullOnMissingStub: true),
])
void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockAuthRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });


  group('login User', () {
    const String username = "testuser";
    const String password = "hello";
    final tAuthModel =
    Auth(message: 'success', token: "token");
    var userData = UserData(username: username, password: password);
    group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          when(mockAuthRemoteDataSource.loginUser(userData))
              .thenAnswer((_) async => tAuthModel);
          // act
          final result = await repository.login(userData);
          // assert
          verify(mockAuthRemoteDataSource.loginUser(userData));
          expect(result, equals(Right(tAuthModel)));
        },
      );
    });

  });
}
