import 'package:json_annotation/json_annotation.dart';

part 'complete_profile_response.g.dart';

@JsonSerializable()
class CompleteProfileResponse {
  final String message;
  final User user;
  final int statusCode;

  CompleteProfileResponse({
    required this.message,
    required this.user,
    required this.statusCode,
  });

  // Factory method for creating a new instance from a map
  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileResponseFromJson(json);

  // Method for converting an instance to a map
  Map<String, dynamic> toJson() => _$CompleteProfileResponseToJson(this);
}

@JsonSerializable()
class User {
  final String name;
  final String bloodGroup;
  final String dob;
  final String gender;
  final String disease;
  final bool profileComplete;

  User({
    required this.name,
    required this.bloodGroup,
    required this.dob,
    required this.gender,
    required this.disease,
    required this.profileComplete,
  });

  // Factory method for creating a new instance from a map
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method for converting an instance to a map
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
