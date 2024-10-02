import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mekaaz/core/repositories/subscription/api/sub_api.dart';
import 'package:mekaaz/core/repositories/subscription/model/add_caretaker_model.dart';
import 'package:mekaaz/core/repositories/subscription/model/add_caretaker_response.dart';
import 'package:mekaaz/core/repositories/subscription/model/get_plan_response.dart';
import 'package:mekaaz/core/repositories/subscription/model/get_subscription_response.dart';
import 'package:mekaaz/core/repositories/subscription/model/purchase_plan_model.dart';
import 'package:mekaaz/core/repositories/subscription/model/purchase_plan_response.dart';
import 'package:mekaaz/core/repositories/subscription/services/subscription_repository.dart';

class SubscriptionApiRepository implements SubscriptionRepository {
  SubscriptionApiRepository(this.client);

  final Dio client;

  @override
  Future<AddCaretakerResponse> addCareTaker(AddCaretakerModel request) async {
    try {
      final response = await SubscriptionApi(client).addCareTaker(request);
      return response;
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      }
      rethrow;
    }
  }

  @override
  Future<GetPlanResponse> getPlan() async {
    final response = await SubscriptionApi(client).getPlan();
    return response;
  }

  @override
  Future<GetSubscriptionResponse> getSubscription() async {
    final response = await SubscriptionApi(client).getSubscription();
    return response;
  }

  @override
  Future<PurchasePlanResponse> purchasePlan(PurchasePlanModel request) async {
    try {
      final response = await SubscriptionApi(client).purchasePlan(request);
      return response;
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      }
      rethrow;
    }
  }




}
