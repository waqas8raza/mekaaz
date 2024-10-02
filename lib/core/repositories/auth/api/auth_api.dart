import 'package:dio/dio.dart';
import 'package:mekaaz/core/repositories/auth/model/complete_profile_model.dart';
import 'package:mekaaz/core/repositories/auth/model/login_email_response.dart';
import 'package:retrofit/retrofit.dart';

import '../model/complete_profile_response.dart';
import '../model/login_email_model.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: 'accounts')
abstract interface class AuthApi {
  factory AuthApi(Dio client) => _AuthApi(client);

 
}
