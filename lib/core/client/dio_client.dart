import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/core/client/api_interceptor.dart';


class ApiHelper{

   static const String apiUrl = 'https://mekaaz.pythonanywhere.com/api/';

  static final client = Dio(
    BaseOptions(
      headers: {"Content-Type":"application/json"},
      baseUrl: apiUrl,
      connectTimeout: const Duration(seconds: 120000),
      receiveTimeout: const Duration(seconds: 120000),
    ),
  )..interceptors.add(AuthorizationInterceptor());
}

final apiClient = Provider((ref) {
  assert(() {
    return true;
  }());

  return ApiHelper.client;
});
