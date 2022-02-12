import 'package:flutter_demo_app/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_demo_app/auth/models/auth.dart';
import 'package:flutter_demo_app/auth/models/user_data.dart';
import 'package:flutter_demo_app/core/services/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([
  ApiService
], customMocks: [
  MockSpec<ApiService>(
      as: #MockSharedPreferencesForTest, returnNullOnMissingStub: true),
])
void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = AuthRemoteDataSourceImpl(
        apiService: mockApiService);
  });

  group('POST login user', () {
    const String username = "testuser";
    const String password = "hello";
    var userData = UserData(username: username, password: password);
    Map<String, dynamic> requestBodyJson = userData.toJson();
    final Auth tAuthModel = Auth(message: "success", token: "token");

    test(
      'should preform a POST request on a URL with user data in request body',
          () {
            //arrange
            when(mockApiService.post('login', requestBodyJson)).thenAnswer((_) async => {"message" : "success", "token": "token"}
            );
            //act
            dataSource.loginUser(userData);
            //assert
            verify(mockApiService.post('login', requestBodyJson));
      },
    );

    test(
      'should return an auth instance in response',
          () async {
        //arrange
        when(mockApiService.post('login', requestBodyJson)).thenAnswer((_) async =>
        {"message" : "success", "token": "token"}
        );
        //act
        var result = await dataSource.loginUser(userData);
        //assert
        expect(result, equals(tAuthModel));

      },
    );
    test(
      'should return an auth equal to tAuthModel',
          () async {
        //arrange
        when(mockApiService.post('login', requestBodyJson)).thenAnswer((_) async =>
        {"message" : "success", "token": "token"}
        );
        //act
        var result = await dataSource.loginUser(userData);
        //assert
        expect(result, equals(tAuthModel));

      },
    );
  });
}
