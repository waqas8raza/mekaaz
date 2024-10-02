import 'package:json_annotation/json_annotation.dart';

part 'login_email_response.g.dart';

@JsonSerializable()
class LoginEmailResponse {
  final String message;
  final String token;
  final User user;
  final int statusCode;

  LoginEmailResponse({
    required this.message,
    required this.token,
    required this.user,
    required this.statusCode,
  });

  factory LoginEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEmailResponseToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String email;
  final bool phoneVerified;
  final bool profileComplete;

  User({
    required this.id,
    required this.email,
    required this.phoneVerified,
    required this.profileComplete,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
