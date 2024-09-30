import 'dart:developer';
import 'package:dio/dio.dart';
import '../utils/shared_pref_service.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor() { _getSharedPrefInstance();}

  Future<void> _getSharedPrefInstance() async {
    sharedPrefService = await SharedPrefService.getInstance();
  }
  static SharedPrefService? sharedPrefService;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SharedPrefService.getString(SharedPrefKey.accessToken);
    log( token.toString());
    if (token?.isNotEmpty ?? false) {
      options.headers["Authorization"] = "Token $token";
    }
    super.onRequest(options,handler);
  }
}
