import 'dart:convert';
import 'dart:io';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/model/check_out_model.dart';
import 'package:green_tech_app/model/checkout_order_model.dart';
import 'package:green_tech_app/model/generic_response.dart';
import 'package:green_tech_app/model/initiate_payment_model.dart';
import 'package:green_tech_app/model/my_cart_model.dart';
import 'package:green_tech_app/services/base_services/api_responss.dart';
import 'package:green_tech_app/services/base_services/base_data_source.dart';
import 'package:green_tech_app/services/base_services/service_const.dart';
import 'package:green_tech_app/utils/local_storage.dart';
import 'package:http/http.dart' as http;

class CartServices extends BaseDatasource {
  Future<ApiResponse<GenericResponse>> addProctToCart(
      String productId, int quantity) async {
    final userId = getIt.get<LocalStorage>().getUserId();
    final response = await sendPut(
        endpoint: 'users/$userId/carts/add-to-cart',
        payload: {"productId": productId, "quantity": quantity});

    return response.transform((data) => GenericResponse.fromJson(data));
  }

  Future<ApiResponse<GenericResponse>> removeProctFromCart(
      String productId, int quantity) async {
    final userId = getIt.get<LocalStorage>().getUserId();
    final response = await sendPut(
        endpoint: 'users/$userId/carts/remove-from-cart',
        payload: {"productId": productId, "quantity": quantity});

    return response.transform((data) => GenericResponse.fromJson(data));
  }

  Future<ApiResponse<MyCartModel>> getMyCart() async {
    final userId = getIt.get<LocalStorage>().getUserId();
    final response = await sendGet(endpoint: 'users/$userId/carts/me');
    return response.transform((data) => MyCartModel.fromJson(data));
  }


  Future<ApiResponse<CheckOutModel>> checkoutCart() async {
    final userId = getIt.get<LocalStorage>().getUserId();
    final response = await sendGet(endpoint: 'users/$userId/carts/checkout');
    return response.transform((data) => CheckOutModel.fromJson(data));
  }

  
  Future<ApiResponse<CheckoutOrderModel>> getOrder(String orderId) async {
    final response = await sendGet(endpoint: 'orders/$orderId');
    return response.transform((data) => CheckoutOrderModel.fromJson(data));
  }


   Future<ApiResponse<GenericResponse>> proceedPayment(String orderId) async {
    final response = await sendPut(endpoint: 'orders/$orderId/process-payment');
    return response.transform((data) => GenericResponse.fromJson(data));
  }


//This is effect from flutterwave payment checkout
  Future<Object> initiatePayment(String? amount) async {
    try {
      const uri = 'https://api.paystack.co/transaction/initialize';
      final response = await http.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Authorization':
              'Bearer sk_test_509502af41592489384d9225bfa6984aded7da3f',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "email": 'jereson94@gmail.com',
          "amount": amount
        }),
      );

      final result = await jsonDecode(response.body);
      logger.d('The result $result');

      if (response.statusCode == 200) {
        return InitiatePaymentResponse.fromJson(result);
      } else {
        return RepoFailure(result["messege"] ?? "Error occured try again");
      }
    } on SocketException {
      return RepoFailure("No internet connection");
    } catch (e) {
      rethrow;
    }
  }
}

abstract class RepoValidator {}

class RepoSucess extends RepoValidator {}

class RepoFailure extends RepoValidator {
  final String errorMessage;
  RepoFailure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
