import 'package:json_annotation/json_annotation.dart';

part 'purchase_plan_model.g.dart';

@JsonSerializable()
class PurchasePlanModel {
  @JsonKey(name: 'plan_id')
  final int planId;

  PurchasePlanModel({
    required this.planId,
  });

  // Factory method to create an instance from JSON
  factory PurchasePlanModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasePlanModelFromJson(json);

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() => _$PurchasePlanModelToJson(this);
}
