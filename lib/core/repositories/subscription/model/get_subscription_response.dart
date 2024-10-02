import 'package:json_annotation/json_annotation.dart';

part 'get_subscription_response.g.dart';

@JsonSerializable()
class GetSubscriptionResponse {
  final String success;
  final List<SubscriptionData> data;
  @JsonKey(name: 'status_code')
  final int statusCode;

  GetSubscriptionResponse({
    required this.success,
    required this.data,
    required this.statusCode,
  });

  // Factory method to create an instance from JSON
  factory GetSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSubscriptionResponseFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$GetSubscriptionResponseToJson(this);
}

@JsonSerializable()
class SubscriptionData {
  final int id;
  final int user;
  final Plan plan;
  @JsonKey(name: 'purchase_date')
  final String purchaseDate;
  @JsonKey(name: 'expiry_date')
  final String expiryDate;

  SubscriptionData({
    required this.id,
    required this.user,
    required this.plan,
    required this.purchaseDate,
    required this.expiryDate,
  });

  // Factory method to create an instance from JSON
  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$SubscriptionDataToJson(this);
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
