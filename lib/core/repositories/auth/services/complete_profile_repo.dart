

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/core/repositories/auth/model/complete_profile_response.dart';

import '../../../client/dio_client.dart';
import '../model/complete_profile_model.dart';



import 'complete_profile_api_repo.dart';

abstract interface class CompleteProfileRepo {
 
Future<CompleteProfileResponse> completeProfile(CompleteProfileModel request);


}

final completeProfileRepositoryProvider = Provider<CompleteProfileRepo>(
  (ref) => CompleteProfileApiRepo(
    ref.read(apiClient),
  ),
);
