import 'package:json_annotation/json_annotation.dart';

part 'complete_profile_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompleteProfileModel {
  final String name;
  final String bloodGroup;
  final String dob;
  final String gender;
  final String address;
  final List<Disease> diseases;

  CompleteProfileModel({
    required this.name,
    required this.bloodGroup,
    required this.dob,
    required this.gender,
    required this.address,
    required this.diseases,
  });

  // Deserialize JSON to Dart object
  factory CompleteProfileModel.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileModelFromJson(json);

  // Serialize Dart object to JSON
  Map<String, dynamic> toJson() => _$CompleteProfileModelToJson(this);
}

@JsonSerializable()
class Disease {
  final String name;
  final String startDate;

  Disease({
    required this.name,
    required this.startDate,
  });

  // Deserialize JSON to Dart object
  factory Disease.fromJson(Map<String, dynamic> json) =>
      _$DiseaseFromJson(json);

  // Serialize Dart object to JSON
  Map<String, dynamic> toJson() => _$DiseaseToJson(this);
}
