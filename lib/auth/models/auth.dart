import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth extends Equatable{
  final String message;
  final String token;

  Auth({required this.message, required this.token});
  
  factory Auth.fromJson(Map<String,dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);

  @override
  List<Object?> get props => [message, token];
}
