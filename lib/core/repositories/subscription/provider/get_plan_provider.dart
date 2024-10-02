import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/core/repositories/subscription/model/get_plan_response.dart';
import 'package:mekaaz/core/repositories/subscription/services/subscription_repository.dart';

final getPlansProvider = FutureProvider<GetPlanResponse>((ref) {
  return ref.watch(subscriptionRepositoryProvider).getPlan();
});
