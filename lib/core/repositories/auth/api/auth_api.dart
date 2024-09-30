import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'auth_api.g.dart';

@RestApi(baseUrl: 'accounts')
abstract class AuthApi {
  factory AuthApi(Dio client) => _AuthApi(client);


}
