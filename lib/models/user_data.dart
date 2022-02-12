import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class User_data {
  User_data({@required String? username, @required String? password});

  late String username;
  late String password;

  factory User_data.fromJson(Map<String, dynamic> json) =>
      _$User_dataFromJson(json);
  Map<String, dynamic> toJson() => _$User_dataToJson(this);
}
