// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_caretaker_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCaretakerResponse _$AddCaretakerResponseFromJson(
        Map<String, dynamic> json) =>
    AddCaretakerResponse(
      success: json['success'] as String,
      data: AddCaretakerModel.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['status_code'] as num).toInt(),
    );

Map<String, dynamic> _$AddCaretakerResponseToJson(
        AddCaretakerResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'status_code': instance.statusCode,
    };
