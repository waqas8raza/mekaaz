

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../client/dio_client.dart';
import '../model/login_email_model.dart';
import '../model/login_email_response.dart';
import '../model/login_phone_model.dart';
import '../model/phone_login_response.dart';
import '../model/update_role_model.dart';
import '../model/update_role_response.dart';
import 'auth_api_repository.dart';

abstract interface class AuthRepository {
 
Future<LoginEmailResponse> emailLogin(LoginEmailModel request);


}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthApiRepository(
    ref.read(apiClient),
  ),
);
