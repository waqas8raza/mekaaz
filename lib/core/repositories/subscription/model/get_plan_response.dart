import 'package:json_annotation/json_annotation.dart';

part 'get_plan_response.g.dart';

@JsonSerializable()
class GetPlanResponse {
  final String success;
  final List<PlanData> data;
  @JsonKey(name: 'status_code')
  final int statusCode;

  GetPlanResponse({
    required this.success,
    required this.data,
    required this.statusCode,
  });

  // Factory method to create an instance from JSON
  factory GetPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlanResponseFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$GetPlanResponseToJson(this);
}

@JsonSerializable()
class PlanData {
  final int id;
  final String name;
  final String price;
  final String description;

  PlanData({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  // Factory method to create an instance from JSON
  factory PlanData.fromJson(Map<String, dynamic> json) =>
      _$PlanDataFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$PlanDataToJson(this);
}
