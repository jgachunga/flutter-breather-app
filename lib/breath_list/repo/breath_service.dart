import 'package:flutter_demo_app/breath_list/data/datasources/breath_data_source.dart';
import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';

class BreathService {
  final BreathDataSource breathDataSource;
  BreathService({required this.breathDataSource});

  Future<BreatheHistory> add(BreatheHistory breatheHistory) {
    return breathDataSource.add(breatheHistory);
  }

  Future<int> delete(int id) {
    return breathDataSource.delete(id);
  }

  Future<List<BreatheHistory>> list() {
    return breathDataSource.getAllBreatheHistory();
  }
}