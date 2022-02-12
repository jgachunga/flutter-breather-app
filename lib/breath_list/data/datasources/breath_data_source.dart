import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';
import 'package:flutter_demo_app/database/db_helper_dynamic.dart';

abstract class BreathDataSource {
  Future<BreatheHistory> add(BreatheHistory breatheHistory);
  Future<List<BreatheHistory>> getAllBreatheHistory();
  Future<int> delete(int id);
}

class BreathLocalDataSource implements BreathDataSource {
  final DatabaseHelper dbHelper;

  BreathLocalDataSource({required this.dbHelper});

  @override
  Future<BreatheHistory> add(BreatheHistory breatheHistory) async {
    breatheHistory.id =
        await dbHelper.insert('breathe_history', breatheHistory.toMap());
    return breatheHistory;
  }

  @override
  Future<List<BreatheHistory>> getAllBreatheHistory() async {
    List<BreatheHistory> listHistory = [];
    List<Map<String, dynamic>> listMap =
        await dbHelper.queryAllRows('breathe_history');
    listHistory = listMap.map((breathRecord) {return BreatheHistory.fromMap(breathRecord);}).toList();
    return listHistory;
  }

  @override
  Future<int> delete(int id) async {
    var deleted = await dbHelper.delete(id, 'breathe_history', 'id');
    return deleted;
  }
}
