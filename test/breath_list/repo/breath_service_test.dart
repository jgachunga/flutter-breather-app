import 'package:flutter_demo_app/breath_list/data/datasources/breath_data_source.dart';
import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';
import 'package:flutter_demo_app/breath_list/repo/breath_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'breath_service_test.mocks.dart';

@GenerateMocks([BreathDataSource])

void main(){
  final createdAt = DateTime.now();
  final tBreathHistoryModel = BreatheHistory(
      id: 1,
      elapsedSeconds: 47,
      elapsedMinutes: 2,
      intervals: 3,
      createdAt: createdAt);
  late MockBreathDataSource mockBreathDataSource;
  late BreathService breathService;

  setUp(() {
    mockBreathDataSource = MockBreathDataSource();
    breathService = BreathService(breathDataSource: mockBreathDataSource);
  });

  group('breath service functions', () {
    test('should call datasource add function when add is called', () async {
      //set up
      when(mockBreathDataSource.add(tBreathHistoryModel)).thenAnswer((_) async => tBreathHistoryModel
      );
      //act
      var result = await breathService.add(tBreathHistoryModel);
      //assert
      verify(mockBreathDataSource.add(tBreathHistoryModel));
      expect(result, tBreathHistoryModel);
    });
    test('should call datasource getAllBreatheHistory function when list is called and return a list', () async {
      //set up
      when(mockBreathDataSource.getAllBreatheHistory()).thenAnswer((_) async => []
      );
      //act
      var result = await breathService.list();
      //assert
      verify(mockBreathDataSource.getAllBreatheHistory());
      expect(result, []);
    });
    test('should call datasource delete function when delete is called', () async {
      //set up
      when(mockBreathDataSource.delete(1)).thenAnswer((_) async => 1
      );
      //act
      var result = await breathService.delete(1);
      //assert
      verify(mockBreathDataSource.delete(1));
      expect(result, 1);
    });

  });
}