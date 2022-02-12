import 'dart:convert';
import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final createdAt = DateTime.now();
  final tBreathHistoryModel = BreatheHistory(
      id: 1,
      elapsedSeconds: 47,
      elapsedMinutes: 2,
      intervals: 3,
      createdAt: createdAt);

  test(
    'should be a subclass of BreatheHistory model',
    () async {
      // assert
      expect(tBreathHistoryModel, isA<BreatheHistory>());
    },
  );

  group('fromMap', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> map = {
          "id": 1,
          "elapsedSeconds": 47,
          "elapsedMinutes": 2,
          "intervals": 3,
          "createdAt": (DateTime.now()).toIso8601String()
        };
        // act
        final result = BreatheHistory.fromMap(map);
        // assert
        expect(result, tBreathHistoryModel);
      },
    );
  });

  group('toMap', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tBreathHistoryModel.toMap();
        // assert
        final expectedJsonMap = {
          "id": 1,
          "elapsedSeconds": 47,
          "elapsedMinutes": 2,
          "intervals": 3,
          "createdAt": (createdAt).toIso8601String()
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
