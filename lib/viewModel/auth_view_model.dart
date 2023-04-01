import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/services/auth_service.dart';
import 'package:green_tech_app/utils/local_storage.dart';
import 'package:green_tech_app/viewModel/base_view_model.dart';
import 'package:green_tech_app/views/screens/auth/signin_screen.dart';
import 'package:green_tech_app/views/screens/nav_screen.dart';
import 'package:green_tech_app/views/widgets/custom_loader.dart';
import 'package:green_tech_app/views/widgets/flushbar_widget.dart';
import 'package:ndialog/ndialog.dart';

class AuthViewModel extends BaseViewModel {
  final authService = getIt.get<AuthService>();

  final sNameController = TextEditingController();
  final sPhoneController = TextEditingController();
  final sEmailController = TextEditingController();
  final sPasswordController = TextEditingController();

  final lemailController = TextEditingController();
  final lPasswordController = TextEditingController();

  Future<void> signupUser(BuildContext context, [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await authService.signupUser(
      name: sNameController.text,
      email: sEmailController.text,
      phone: sPhoneController.text,
      password: sPasswordController.text,
    );
    progressDialog.dismiss();
    if (!result.hasError!) {
      if (!mounted) return;
      Navigator.of(context)
          .pushNamedAndRemoveUntil(SigninScreen.routeName, (route) => false);
    } else {
      if (!mounted) return;
      flushbar(
          context: context,
          title: 'Error',
          message: result.error.toString(),
          isSuccess: false);
    }
  }

  Future<void> signinUser(BuildContext context, [bool mounted = true]) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await authService.signinUser(
      lemailController.text,
      lPasswordController.text,
    );
    progressDialog.dismiss();
    if (!result.hasError!) {
      await getIt.get<LocalStorage>().saveUserToken(result.data!.token!);

      if (!mounted) return;
      Navigator.of(context)
          .pushNamedAndRemoveUntil(BottomNavPage.routeName, (route) => false);
    } else {
      if (!mounted) return;
      flushbar(
          context: context,
          title: 'Error',
          message: result.error.toString(),
          isSuccess: false);
    }
  }
}
