import 'package:equatable/equatable.dart';

class BreatheHistory extends Equatable {
  late int? id;
  late int? elapsedMinutes;
  late int? elapsedSeconds;
  late int? intervals;
  late DateTime? createdAt;

  BreatheHistory({
    this.id,
    this.elapsedMinutes,
    this.elapsedSeconds,
    this.intervals,
    this.createdAt,
  }) : super();

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'elapsedMinutes': elapsedMinutes,
      'elapsedSeconds': elapsedSeconds,
      'intervals': intervals,
      'createdAt': createdAt!.toIso8601String(),
    };
    return map;
  }

  factory BreatheHistory.fromMap(Map<String, dynamic> map) {
    return BreatheHistory(
        id: map['id'],
        elapsedMinutes: map['elapsedMinutes'],
        elapsedSeconds: map['elapsedSeconds'],
        intervals: map['intervals'],
        createdAt: DateTime.parse(map['createdAt']));
  }
}
