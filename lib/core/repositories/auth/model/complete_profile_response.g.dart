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
      'user': instance.user,
      'statusCode': instance.statusCode,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      bloodGroup: json['bloodGroup'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      disease: json['disease'] as String,
      profileComplete: json['profileComplete'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'bloodGroup': instance.bloodGroup,
      'dob': instance.dob,
      'gender': instance.gender,
      'disease': instance.disease,
      'profileComplete': instance.profileComplete,
    };
