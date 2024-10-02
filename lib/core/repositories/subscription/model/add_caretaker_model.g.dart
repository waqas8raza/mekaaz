// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_caretaker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCaretakerModel _$AddCaretakerModelFromJson(Map<String, dynamic> json) =>
    AddCaretakerModel(
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String,
      age: json['age'] as String,
      relationship: json['relationship'] as String,
      averageTime: json['average_time'] as String,
    );

Map<String, dynamic> _$AddCaretakerModelToJson(AddCaretakerModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'age': instance.age,
      'relationship': instance.relationship,
      'average_time': instance.averageTime,
    };
