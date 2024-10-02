// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlanResponse _$GetPlanResponseFromJson(Map<String, dynamic> json) =>
    GetPlanResponse(
      success: json['success'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => PlanData.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$GetPlanResponseToJson(GetPlanResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'status_code': instance.statusCode,
    };

PlanData _$PlanDataFromJson(Map<String, dynamic> json) => PlanData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PlanDataToJson(PlanData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
