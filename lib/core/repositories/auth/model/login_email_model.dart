import 'package:json_annotation/json_annotation.dart';

part 'login_email_model.g.dart';

@JsonSerializable()
class LoginEmailModel {
  final String email;
  final String password;

  LoginEmailModel({
    required this.email,
    required this.password,
  });

  factory LoginEmailModel.fromJson(Map<String, dynamic> json) => _$LoginEmailModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEmailModelToJson(this);
}
