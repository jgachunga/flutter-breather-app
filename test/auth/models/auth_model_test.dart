import 'package:flutter_demo_app/auth/models/auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  const message = "success";
  const token = "dfdsdfgsf -sfgsf sgfgsfgdfg fdgdfg dfg dfg";

  final tAuthModel = Auth(
      message: message,
      token: token,
      );

  test(
    'should be a subclass of Auth model',
        () async {
      // assert
      expect(tAuthModel, isA<Auth>());
    },
  );

  group('toJson', () {
    test(
      'should return a valid json map when the message and token is provided',
          () async {
        // arrange
        final Map<String, dynamic> map = {
          "message":message,
          "token": token
        };
        // act
        final result = Auth(message: message, token: token).toJson();
        // assert
        expect(result, map);
      },
    );
  });

}