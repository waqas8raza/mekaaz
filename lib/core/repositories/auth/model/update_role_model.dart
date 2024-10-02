import 'package:json_annotation/json_annotation.dart';

part 'update_role_model.g.dart';

@JsonSerializable()
class UpdateRoleModel {
  final String role;

  UpdateRoleModel({
    required this.role,
  });

  factory UpdateRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRoleModelToJson(this);
}
