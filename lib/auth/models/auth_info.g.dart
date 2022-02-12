// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthInfo _$AuthInfoFromJson(Map<String, dynamic> json) => AuthInfo()
  ..userName = json['userName'] as String
  ..loggedIn = json['loggedIn'] as String
  ..token = json['token'] as String;

Map<String, dynamic> _$AuthInfoToJson(AuthInfo instance) => <String, dynamic>{
      'userName': instance.userName,
      'loggedIn': instance.loggedIn,
      'token': instance.token,
    };
