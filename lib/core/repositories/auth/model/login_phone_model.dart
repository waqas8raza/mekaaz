import 'package:json_annotation/json_annotation.dart';

part 'login_phone_model.g.dart';

@JsonSerializable()
class LoginPhoneModel {
   @JsonKey(includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(includeIfNull: false)
  final String? verificationCode;

  LoginPhoneModel({ this.phoneNumber,this.verificationCode});

  factory LoginPhoneModel.fromJson(Map<String, dynamic> json) =>
      _$LoginPhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPhoneModelToJson(this);
}
