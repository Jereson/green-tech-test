import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/model/user_detail_model.dart';
import 'package:green_tech_app/services/base_services/service_const.dart';
import 'package:green_tech_app/services/profile_service.dart';
import 'package:green_tech_app/utils/local_storage.dart';
import 'package:green_tech_app/viewModel/base_view_model.dart';
import 'package:green_tech_app/views/screens/auth/signin_screen.dart';
import 'package:green_tech_app/views/widgets/custom_loader.dart';
import 'package:ndialog/ndialog.dart';

class ProfileViewModel extends BaseViewModel {
  UserDetailModel? cachedUserDetail;
  final profileService = getIt.get<ProfileService>();

  Future<void> getUserDetail() async {
    final result = await profileService.getUserDetail();

    if (!result.hasError!) {
      cachedUserDetail = result.data;
      setState();
      logger.d(cachedUserDetail!.data!.balance);
    }
  }

  Future<void> logout(BuildContext context) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await profileService.logout();
    progressDialog.dismiss();
    if (!result.hasError!) {
      await getIt.get<LocalStorage>().removeUserToken();
      if (context.mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(SigninScreen.routeName, (route) => false);
      }
    }
  }

  Future<void> deleteUser(
    BuildContext context,
  ) async {
    CustomProgressDialog progressDialog = CustomProgressDialog(context,
        blur: 2, loadingWidget: const CustomLoader(), dismissable: false);
    progressDialog.show();
    final result = await profileService.deletUser(cachedUserDetail!.data!.id!);
    progressDialog.dismiss();
    if (!result.hasError!) {
      await getIt.get<LocalStorage>().removeUserToken();
      if (context.mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(SigninScreen.routeName, (route) => false);
      }
    }
  }
}
