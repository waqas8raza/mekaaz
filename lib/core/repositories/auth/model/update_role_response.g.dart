// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_role_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRoleResponse _$UpdateRoleResponseFromJson(Map<String, dynamic> json) =>
    UpdateRoleResponse(
      message: json['message'] as String,
      role: json['role'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateRoleResponseToJson(UpdateRoleResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'role': instance.role,
      'statusCode': instance.statusCode,
    };
