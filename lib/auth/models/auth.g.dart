// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
