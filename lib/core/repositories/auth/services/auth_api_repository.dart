import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mekaaz/core/repositories/auth/api/auth_api.dart';
import 'package:mekaaz/core/repositories/auth/model/login_email_model.dart';
import 'package:mekaaz/core/repositories/auth/model/login_email_response.dart';
import 'package:mekaaz/core/utils/shared_pref_service.dart';

import '../model/complete_profile_model.dart';
import '../model/complete_profile_response.dart';
import 'auth_repository.dart';

class AuthApiRepository implements AuthRepository {
  AuthApiRepository(this.client);

  final Dio client;

  @override
  Future<LoginEmailResponse> emailLogin(LoginEmailModel request) async {
    try {
      final response = await AuthApi(client).emailLogin(request);
      await SharedPrefService.saveString(
          SharedPrefKey.accessToken, response.token);
      return response;
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      }
      rethrow;
    }
  }
  @override
  Future<CompleteProfileResponse> completeProfile(CompleteProfileModel request) async {
    try {
      final responses = await AuthApi(client).completeProfile(request);
     
      return responses; // Return the response
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      }
      rethrow;
    }
  }
}
