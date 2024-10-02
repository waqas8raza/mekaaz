// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneLoginResponse _$PhoneLoginResponseFromJson(Map<String, dynamic> json) =>
    PhoneLoginResponse(
      message: json['message'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$PhoneLoginResponseToJson(PhoneLoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'statusCode': instance.statusCode,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      phoneNumber: json['phoneNumber'] as String,
      verificationCode: json['verificationCode'] as String,
      phoneVerified: json['phoneVerified'] as bool,
      profileComplete: json['profileComplete'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'verificationCode': instance.verificationCode,
      'phoneVerified': instance.phoneVerified,
      'profileComplete': instance.profileComplete,
    };
