

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../client/dio_client.dart';
import '../model/complete_profile_model.dart';
import '../model/complete_profile_response.dart';
import '../model/login_email_model.dart';
import '../model/login_email_response.dart';
import 'auth_api_repository.dart';

abstract interface class AuthRepository {
 
Future<LoginEmailResponse> emailLogin(LoginEmailModel request);

Future<CompleteProfileResponse> completeProfile(CompleteProfileModel request);

}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthApiRepository(
    ref.read(apiClient),
  ),
);
