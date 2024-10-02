import 'package:json_annotation/json_annotation.dart';

part 'purchase_plan_response.g.dart';

@JsonSerializable()
class PurchasePlanResponse {
  final String success;
  final PurchasePlanData data;
  @JsonKey(name: 'status_code')
  final int statusCode;

  PurchasePlanResponse({
    required this.success,
    required this.data,
    required this.statusCode,
  });

  // Factory method to create an instance from JSON
  factory PurchasePlanResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchasePlanResponseFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$PurchasePlanResponseToJson(this);
}

@JsonSerializable()
class PurchasePlanData {
  final int id;
  final int user;
  final Plan plan;
  @JsonKey(name: 'purchase_date')
  final DateTime purchaseDate;
  @JsonKey(name: 'expiry_date')
  final DateTime expiryDate;

  PurchasePlanData({
    required this.id,
    required this.user,
    required this.plan,
    required this.purchaseDate,
    required this.expiryDate,
  });

  // Factory method to create an instance from JSON
  factory PurchasePlanData.fromJson(Map<String, dynamic> json) =>
      _$PurchasePlanDataFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$PurchasePlanDataToJson(this);
}

@JsonSerializable()
class Plan {
  final int id;
  final String name;
  final String price;
  final String description;

  Plan({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  // Factory method to create an instance from JSON
  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
