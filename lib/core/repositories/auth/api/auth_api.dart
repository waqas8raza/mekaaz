import 'package:dio/dio.dart';
import 'package:mekaaz/core/repositories/auth/model/login_email_response.dart';
import 'package:mekaaz/core/repositories/auth/model/phone_login_response.dart';
import 'package:mekaaz/core/repositories/auth/model/update_role_response.dart';
import 'package:retrofit/retrofit.dart';

import '../model/complete_profile_response.dart';
import '../model/login_email_model.dart';


part 'auth_api.g.dart';

@RestApi(baseUrl: "")
abstract interface class AuthApi {
  factory AuthApi(Dio client) => _AuthApi(client);
@POST("loginEmail/")
Future<LoginEmailResponse> emailLogin(@Body() LoginEmailModel request);
 
}
