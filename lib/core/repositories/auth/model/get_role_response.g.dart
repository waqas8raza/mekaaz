// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_role_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoleResponse _$GetRoleResponseFromJson(Map<String, dynamic> json) =>
    GetRoleResponse(
      role: json['role'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$GetRoleResponseToJson(GetRoleResponse instance) =>
    <String, dynamic>{
      'role': instance.role,
      'statusCode': instance.statusCode,
    };
