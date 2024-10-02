import 'package:json_annotation/json_annotation.dart';

part 'complete_profile_response.g.dart';

@JsonSerializable(explicitToJson: true)
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

@JsonSerializable(explicitToJson: true)
class User {
  final String name;
  final String bloodGroup;
  final String dob;
  final String gender;
  final String address;
  final List<Disease> diseases; // Changed to a list of Disease objects
  final bool profileComplete;

  User({
    required this.name,
    required this.bloodGroup,
    required this.dob,
    required this.gender,
    required this.address,
    required this.diseases, // Now handling a list of diseases
    required this.profileComplete,
  });

  // Factory method for creating a new instance from a map
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method for converting an instance to a map
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Disease {
  final String name;
  @JsonKey(name: 'start_date') // Map 'start_date' in JSON to startDate in Dart
  final String startDate;

  Disease({
    required this.name,
    required this.startDate,
  });

  // Factory method for creating a new instance from a map
  factory Disease.fromJson(Map<String, dynamic> json) => _$DiseaseFromJson(json);

  // Method for converting an instance to a map
  Map<String, dynamic> toJson() => _$DiseaseToJson(this);
}
