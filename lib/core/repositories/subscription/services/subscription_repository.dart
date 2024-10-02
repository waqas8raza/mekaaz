import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../client/dio_client.dart';
import '../model/add_caretaker_model.dart';
import '../model/add_caretaker_response.dart';
import '../model/get_plan_response.dart';
import '../model/get_subscription_response.dart';
import '../model/purchase_plan_model.dart';
import '../model/purchase_plan_response.dart';
import 'subscription_api_repository.dart';

abstract interface class SubscriptionRepository {


  Future<GetPlanResponse> getPlan();

  Future<GetSubscriptionResponse> getSubscription();

  Future<PurchasePlanResponse> purchasePlan( PurchasePlanModel request);

  Future<AddCaretakerResponse> addCareTaker( AddCaretakerModel request);
}

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>(
  (ref) => SubscriptionApiRepository(
    ref.read(apiClient),
  ),
);
