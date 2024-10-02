import 'package:json_annotation/json_annotation.dart';

part 'add_caretaker_model.g.dart';

@JsonSerializable()
class AddCaretakerModel {
  final String email;
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  final String gender;
  final String age;
  final String relationship;
  @JsonKey(name: 'average_time')
  final String averageTime;

  AddCaretakerModel({
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.relationship,
    required this.averageTime,
  });

  // Factory method to create an instance from JSON
  factory AddCaretakerModel.fromJson(Map<String, dynamic> json) =>
      _$AddCaretakerModelFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$AddCaretakerModelToJson(this);
}
