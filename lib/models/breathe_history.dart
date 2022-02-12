// ignore_for_file: file_names, non_constant_identifier_names

class BreatheHistory {
  late int? id;
  late String? name;
  late int? elapsedMinutes;
  late int? elapsedSeconds;
  late int? intervals;
  late DateTime created_at;
  //BreatheHistory(this.id, this.name, this.breathe_time, this.created_at);

  BreatheHistory({
    this.id,
    this.name,
    required this.elapsedMinutes,
    required this.elapsedSeconds,
    required this.intervals,
    required this.created_at,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'elapsedMinutes': elapsedMinutes,
      'elapsedSeconds': elapsedSeconds,
      'intervals': intervals,
      'created_at': created_at.toIso8601String(),
    };
    return map;
  }

  BreatheHistory.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    elapsedMinutes = map['elapsedMinutes'];
    elapsedSeconds = map['elapsedSeconds'];
    intervals = map['intervals'];
    created_at = DateTime.parse(map['created_at']);
  }
}
