// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPhoneModel _$LoginPhoneModelFromJson(Map<String, dynamic> json) =>
    LoginPhoneModel(
      phoneNumber: json['phoneNumber'] as String?,
      verificationCode: json['verificationCode'] as String?,
    );

Map<String, dynamic> _$LoginPhoneModelToJson(LoginPhoneModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('verificationCode', instance.verificationCode);
  return val;
}
