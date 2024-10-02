// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEmailResponse _$LoginEmailResponseFromJson(Map<String, dynamic> json) =>
    LoginEmailResponse(
      message: json['message'] as String,
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$LoginEmailResponseToJson(LoginEmailResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
      'statusCode': instance.statusCode,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      phoneVerified: json['phoneVerified'] as bool,
      profileComplete: json['profileComplete'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneVerified': instance.phoneVerified,
      'profileComplete': instance.profileComplete,
    };
