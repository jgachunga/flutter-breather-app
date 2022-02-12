import 'package:flutter_demo_app/breath_list/data/datasources/breath_data_source.dart';
import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';
import 'package:flutter_demo_app/database/db_helper_dynamic.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'breath_local_data_source_test.mocks.dart';

@GenerateMocks([
  DatabaseHelper
], customMocks: [
  MockSpec<DatabaseHelper>(as: #MockDBHelperForTest, returnNullOnMissingStub: true),
])
void main() {
  late MockDatabaseHelper mockDbHelper;
  final createdAt = DateTime.now();
  late BreathLocalDataSource localDataSource;
  List<BreatheHistory> breathHistoryList = [];
  final tBreathHistoryModel = BreatheHistory(
      id: 1,
      elapsedSeconds: 47,
      elapsedMinutes: 2,
      intervals: 3,
      createdAt: createdAt);
  setUp(() {
    mockDbHelper = MockDatabaseHelper();
    localDataSource = BreathLocalDataSource(dbHelper: mockDbHelper);
  });
  group('database functions calling',  () {
    test("should verify breath data is added successfully", () async {
      //arrange
      when(mockDbHelper.insert('breathe_history', tBreathHistoryModel.toMap()))
          .thenAnswer((_) async => 1);
      //act
      final result = await localDataSource.add(tBreathHistoryModel);
      //assert
      verify(mockDbHelper.insert('breathe_history', tBreathHistoryModel.toMap()));
      expect(result, equals(tBreathHistoryModel));
    });
    test("should return an array on query all rows", () async {
      //arrange
      when(mockDbHelper.queryAllRows('breathe_history'))
          .thenAnswer((_) async => []);
      //act
      final result = await localDataSource.getAllBreatheHistory();
      //assert
      verify(mockDbHelper.queryAllRows('breathe_history'));
      expect(result, equals(breathHistoryList));
    });
    test("should call delete on db helper", () async {
      //arrange
      when(mockDbHelper.delete(1, 'breathe_history', 'id'))
          .thenAnswer((_) async => 1);
      //act
      final result = await localDataSource.delete(1);
      //assert
      verify(mockDbHelper.delete(1, 'breathe_history', 'id'));
      expect(result, equals(1));
    });
  });
}
