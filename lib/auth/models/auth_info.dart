import 'package:json_annotation/json_annotation.dart';

part 'auth_info.g.dart';

@JsonSerializable()
class AuthInfo {
  AuthInfo();

  late String userName;
  late String loggedIn;
  late String token;

  factory AuthInfo.fromJson(Map<String,dynamic> json) => _$AuthInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthInfoToJson(this);
}
