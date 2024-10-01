import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mekaaz/core/repositories/auth/api/auth_api.dart';
import 'package:mekaaz/core/repositories/auth/model/complete_profile_model.dart';
import 'package:mekaaz/core/repositories/auth/model/complete_profile_response.dart';

import 'complete_profile_repo.dart';

class CompleteProfileApiRepo implements CompleteProfileRepo {
  CompleteProfileApiRepo(this.client);

  final Dio client;

  @override
  Future<CompleteProfileResponse> completeProfile(
      CompleteProfileModel request) async {
    try {
      // Convert request model to JSON using toJson()
      final Map<String, dynamic> requestData = request.toJson();

      // Send the request to the AuthApi to update the profile
      final response = await AuthApi(client).completeProfile(requestData);

      // Log the response for debugging
      log('Profile update response: $response');
      

      // Convert the response to a CompleteProfileResponse
      return CompleteProfileResponse.fromJson(
          response.message as Map<String, dynamic>);
    } catch (e) {
      if (e is DioException) {
        // Log the error message if there is a DioException
        log(e.toString());
      }
      rethrow;
    }
  }
}
