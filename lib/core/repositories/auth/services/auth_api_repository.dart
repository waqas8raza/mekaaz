import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mekaaz/core/repositories/auth/api/auth_api.dart';
import 'package:mekaaz/core/repositories/auth/model/get_role_response.dart';
import 'package:mekaaz/core/repositories/auth/model/login_email_model.dart';
import 'package:mekaaz/core/repositories/auth/model/login_email_response.dart';
import 'package:mekaaz/core/repositories/auth/model/login_phone_model.dart';
import 'package:mekaaz/core/repositories/auth/model/phone_login_response.dart';
import 'package:mekaaz/core/repositories/auth/model/update_role_model.dart';
import 'package:mekaaz/core/repositories/auth/model/update_role_response.dart';
import 'package:mekaaz/core/utils/shared_pref_service.dart';

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
  Future<PhoneLoginResponse> phoneLogin(LoginPhoneModel request) async {
    try {
      final response = await AuthApi(client).phoneLogin(request);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<GetRoleResponse> getRole()async {
    final response=await AuthApi(client).getRole();

    return response;
  }

  @override
  Future<UpdateRoleResponse> updateRole(UpdateRoleModel request)async {
   final response =await AuthApi(client).updateRole(request);
   return response;
   }
}
