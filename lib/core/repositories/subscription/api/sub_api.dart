import 'package:dio/dio.dart';
import 'package:mekaaz/core/repositories/subscription/model/add_caretaker_response.dart';
import 'package:mekaaz/core/repositories/subscription/model/get_plan_response.dart';
import 'package:mekaaz/core/repositories/subscription/model/get_subscription_response.dart';
import 'package:mekaaz/core/repositories/subscription/model/purchase_plan_response.dart';
import 'package:retrofit/retrofit.dart';

import '../model/add_caretaker_model.dart';
import '../model/purchase_plan_model.dart';

part 'sub_api.g.dart';

@RestApi(baseUrl: "")
abstract interface class SubscriptionApi {
  factory SubscriptionApi(Dio client) => _SubscriptionApi(client);


  @GET("plans/")
  Future<GetPlanResponse>getPlan();

  @GET("subscriptions/")
  Future<GetSubscriptionResponse>getSubscription();

  @POST("purchase/")
  Future<PurchasePlanResponse> purchasePlan(@Body() PurchasePlanModel request );

  @POST("caretakers/")
  Future<AddCaretakerResponse> addCareTaker(@Body() AddCaretakerModel request );


}
