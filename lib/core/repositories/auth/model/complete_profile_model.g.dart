// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteProfileModel _$CompleteProfileModelFromJson(
        Map<String, dynamic> json) =>
    CompleteProfileModel(
      name: json['name'] as String,
      bloodGroup: json['bloodGroup'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      diseases: (json['diseases'] as List<dynamic>)
          .map((e) => Disease.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompleteProfileModelToJson(
        CompleteProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bloodGroup': instance.bloodGroup,
      'dob': instance.dob,
      'gender': instance.gender,
      'address': instance.address,
      'diseases': instance.diseases.map((e) => e.toJson()).toList(),
    };

Disease _$DiseaseFromJson(Map<String, dynamic> json) => Disease(
      name: json['name'] as String,
      startDate: json['start_date'] as String,
    );

Map<String, dynamic> _$DiseaseToJson(Disease instance) => <String, dynamic>{
      'name': instance.name,
      'start_date': instance.startDate,
    };
