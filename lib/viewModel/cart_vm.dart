import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/model/check_out_model.dart';
import 'package:green_tech_app/model/initiate_payment_model.dart';
import 'package:green_tech_app/model/my_cart_model.dart';
import 'package:green_tech_app/services/cart_service.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/viewModel/base_view_model.dart';
import 'package:green_tech_app/viewModel/product_view_model.dart';
import 'package:green_tech_app/views/screens/payment_screen.dart';
import 'package:green_tech_app/views/widgets/custom_dialog.dart';
import 'package:green_tech_app/views/widgets/custom_loader.dart';
import 'package:green_tech_app/views/widgets/flushbar_widget.dart';
import 'package:ndialog/ndialog.dart';

class CartViewModel extends BaseViewModel {
  final cartService = getIt.get<CartServices>();
  MyCartModel? cachedMyCartModel;

  Products? selecetedProducts;

  CheckOutModel? checkOutModel;

  int totalPrice = 0;
  int itemCount = 1;
  int cartCount = 0;

  String? authorizedUrl;
  String? referalCode;
  String paymentAmount = '0';
  String? checkoutOrderId;

  // int cartQuantity = 0;
  // int selectedCartPrice = 0;

  void increamentItemCount(int price) {
    // if (itemCount > 0) {
    itemCount++;
    totalPrice = price * itemCount;
    setState();
    // }
  }

  void decreamentItemCount(int price) {
    if (itemCount > 0) {
      itemCount--;
      totalPrice = price * itemCount;
      setState();
    }
  }

  void setInitTotalPrice(int price) {
    totalPrice = price * itemCount;
    setState();
  }

  Future<void> resetDataOnInit() async {
    totalPrice = 0;
    itemCount = 1;
    cartCount = 0;
  }

  Future<void> addProductToCart(
      BuildContext context, String productId, int quantity,
      [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await cartService.addProctToCart(productId, quantity);

    if (!result.hasError!) {
      await getMyCart();
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
          context: context,
          title: 'Item added to cart succssfully',
          btnText: 'Done',
          textColor: kcPrimaryColor,
          callback: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });
    } else {
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
        context: context,
        title: result.error.toString(),
        btnText: 'Try again',
        textColor: kcE51414,
        callback: () {
          Navigator.pop(context);
        },
      );
    }
  }

  Future<void> removeProctFromCart(
      BuildContext context, String productId, int quantity,
      [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await cartService.removeProctFromCart(productId, quantity);

    if (!result.hasError!) {
      await getMyCart();
      if (!mounted) return;
      progressDialog.dismiss();
      flushbar(
          context: context,
          title: 'Success',
          message: 'Item removed from cart succssfully',
          isSuccess: true);
    } else {
      if (!mounted) return;
      progressDialog.dismiss();
      flushbar(
          context: context,
          title: 'Failed',
          message: 'Operation failed, try again',
          isSuccess: false);
    }
  }

  Future<void> getMyCart() async {
    final result = await cartService.getMyCart();
    if (!result.hasError!) {
      cachedMyCartModel = result.data;
      setState();
    }
  }

  Future<void> checkoutCart(BuildContext context, [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await cartService.checkoutCart();

    if (!result.hasError!) {
      checkOutModel = result.data!;
      setState();
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
          context: context,
          title: 'Checkout completed click proceed to continue',
          btnText: 'Proceed',
          textColor: kcPrimaryColor,
          isCancel: false,
          callback: () {
            getOrder(context, checkOutModel!.data!.id!);
          });
    } else {
      await getMyCart();
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
        context: context,
        title: result.error.toString(),
        btnText: 'Try again',
        textColor: kcE51414,
        callback: () {
          Navigator.pop(context);
        },
      );
    }
  }

  Future<void> getOrder(BuildContext context, String checkOutOrderId,
      [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await cartService.getOrder(checkOutOrderId);

    if (!result.hasError!) {
      checkoutOrderId = result.data!.data!.id;
      setState();
      if (!mounted) return;
      progressDialog.dismiss();
      proceedPayment(context, result.data!.data!.id!);
      // Navigator.of(context).pushNamed(PaymentScreen.routeName);
    } else {
      await getMyCart();
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
        context: context,
        title: result.error.toString(),
        btnText: 'Try again',
        textColor: kcE51414,
        callback: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    }
  }

  Future<void> proceedPayment(BuildContext context, String orderId,
      [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await cartService.proceedPayment(orderId);

    if (!result.hasError!) {
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
          context: context,
          title: 'Payment complete',
          btnText: 'Back',
          textColor: kcPrimaryColor,
          isCancel: false,
          callback: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });
    } else {
      await getMyCart();
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
        context: context,
        title: result.error.toString(),
        btnText: 'Try again',
        textColor: kcE51414,
        isPopNext: true,
        popCallback: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        callback: () {
          Navigator.pop(context);
        },
      );
    }
  }

  Future<void> initiatePayment(BuildContext context, String amount,
      [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);

    progressDialog.show();
    try {
      final result = await cartService.initiatePayment(amount);
      progressDialog.dismiss();

      if (result is InitiatePaymentResponse) {
        authorizedUrl = result.data!.authorizationUrl;
        referalCode = result.data!.reference;
        setState();
        if (!mounted) return;
        Navigator.of(context).pushNamed(PaymentScreen.routeName);
      } else {
        if (!mounted) return;
        flushbar(
            context: context,
            title: 'Error',
            message: 'Count not initiate payment',
            isSuccess: false);
      }
    } catch (e) {
      progressDialog.dismiss();
      flushbar(
          context: context,
          title: 'Error',
          message: 'Error occured',
          isSuccess: false);
    }
  }

  Future<void> topUp(BuildContext context, num amount,
      [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await cartService.topUp(amount);

    if (!result.hasError!) {
      await getIt.get<ProductViewModel>().catchedUserDetail();
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
        context: context,
        title: 'Transaction completed',
        btnText: 'Done',
        textColor: kcE51414,
        callback: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      );
    } else {
      await getMyCart();
      if (!mounted) return;
      progressDialog.dismiss();
      showSuccess(
        context: context,
        title: result.error.toString(),
        btnText: 'Try again',
        textColor: kcE51414,
        callback: () {
          topUp(context, amount);
        },
      );
    }
  }

  // void setSelected(Products products) {
  //   cartQuantity = 0;
  //   selecetedProducts = products;
  //   cartQuantity = products.quantity!;
  //   selectedCartPrice = products.price!;
  //   // setState();
  // }
}
