// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubscriptionResponse _$GetSubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    GetSubscriptionResponse(
      success: json['success'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => SubscriptionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$GetSubscriptionResponseToJson(
        GetSubscriptionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'status_code': instance.statusCode,
    };

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) =>
    SubscriptionData(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      plan: Plan.fromJson(json['plan'] as Map<String, dynamic>),
      purchaseDate: json['purchase_date'] as String,
      expiryDate: json['expiry_date'] as String,
    );

Map<String, dynamic> _$SubscriptionDataToJson(SubscriptionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'plan': instance.plan,
      'purchase_date': instance.purchaseDate,
      'expiry_date': instance.expiryDate,
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
