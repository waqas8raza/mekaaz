// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteProfileResponse _$CompleteProfileResponseFromJson(
        Map<String, dynamic> json) =>
    CompleteProfileResponse(
      message: json['message'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$CompleteProfileResponseToJson(
        CompleteProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user.toJson(),
      'statusCode': instance.statusCode,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      bloodGroup: json['bloodGroup'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      diseases: (json['diseases'] as List<dynamic>)
          .map((e) => Disease.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileComplete: json['profileComplete'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'bloodGroup': instance.bloodGroup,
      'dob': instance.dob,
      'gender': instance.gender,
      'address': instance.address,
      'diseases': instance.diseases.map((e) => e.toJson()).toList(),
      'profileComplete': instance.profileComplete,
    };

Disease _$DiseaseFromJson(Map<String, dynamic> json) => Disease(
      name: json['name'] as String,
      startDate: json['start_date'] as String,
    );

Map<String, dynamic> _$DiseaseToJson(Disease instance) => <String, dynamic>{
      'name': instance.name,
      'start_date': instance.startDate,
    };
