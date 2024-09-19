

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../client/dio_client.dart';
import 'auth_api_repository.dart';

abstract interface class AuthRepository {
 
}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthApiRepository(
    ref.read(apiClient),
  ),
);
