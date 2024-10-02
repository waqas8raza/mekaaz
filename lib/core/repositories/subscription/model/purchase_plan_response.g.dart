// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasePlanResponse _$PurchasePlanResponseFromJson(
        Map<String, dynamic> json) =>
    PurchasePlanResponse(
      success: json['success'] as String,
      data: PurchasePlanData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$PurchasePlanResponseToJson(
        PurchasePlanResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'status_code': instance.statusCode,
    };

PurchasePlanData _$PurchasePlanDataFromJson(Map<String, dynamic> json) =>
    PurchasePlanData(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      plan: Plan.fromJson(json['plan'] as Map<String, dynamic>),
      purchaseDate: DateTime.parse(json['purchase_date'] as String),
      expiryDate: DateTime.parse(json['expiry_date'] as String),
    );

Map<String, dynamic> _$PurchasePlanDataToJson(PurchasePlanData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'plan': instance.plan,
      'purchase_date': instance.purchaseDate.toIso8601String(),
      'expiry_date': instance.expiryDate.toIso8601String(),
    };

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };
