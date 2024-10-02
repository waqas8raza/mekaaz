import 'package:json_annotation/json_annotation.dart';

part 'update_role_response.g.dart';

@JsonSerializable()
class UpdateRoleResponse {
  final String message;
  final String role;
  final int statusCode;

  UpdateRoleResponse({
    required this.message,
    required this.role,
    required this.statusCode,
  });


  factory UpdateRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRoleResponseToJson(this);
}
