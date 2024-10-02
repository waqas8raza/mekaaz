import 'package:json_annotation/json_annotation.dart';

part 'get_role_response.g.dart';

@JsonSerializable()
class GetRoleResponse {
  final String? role;
  final int statusCode;

  GetRoleResponse({
    this.role,
    required this.statusCode,
  });

  // A necessary factory constructor for creating a new instance from a map.
  factory GetRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoleResponseFromJson(json);

  // A method to serialize the instance to a map.
  Map<String, dynamic> toJson() => _$GetRoleResponseToJson(this);
}
