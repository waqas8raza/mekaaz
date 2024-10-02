import 'package:json_annotation/json_annotation.dart';
import 'add_caretaker_model.dart'; // Import the AddCaretakerModel class

part 'add_caretaker_response.g.dart';

@JsonSerializable()
class AddCaretakerResponse {
  final String success;
  final AddCaretakerModel data; // Reference to the AddCaretakerModel
  @JsonKey(name: 'status_code')
  final int statusCode;

  AddCaretakerResponse({
    required this.success,
    required this.data,
    required this.statusCode,
  });

  // Factory method to create an instance from JSON
  factory AddCaretakerResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCaretakerResponseFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$AddCaretakerResponseToJson(this);
}
