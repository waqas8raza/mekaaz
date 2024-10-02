import 'package:json_annotation/json_annotation.dart';

part 'phone_login_response.g.dart';

@JsonSerializable()
class PhoneLoginResponse {
  final String message;
  final User user;
  final int statusCode;
  final String token;

  PhoneLoginResponse({
    required this.message,
    required this.user,
    required this.statusCode,
    required this.token,
  });

  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneLoginResponseToJson(this);
}

@JsonSerializable()
class User {
  final String phoneNumber;
  final String verificationCode;
  final bool phoneVerified;
  final bool profileComplete;

  User({
    required this.phoneNumber,
    required this.verificationCode,
    required this.phoneVerified,
    required this.profileComplete,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
