import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/profile_vm.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = 'profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetail = getIt.get<ProfileViewModel>().cachedUserDetail!.data!;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text('Profile', style: stBlack50016),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child: const Icon(Icons.photo_outlined),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                        color: kcPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.photo_camera_back_outlined,
                        size: 15,
                        color: kcWhite,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: stBlackWithOpacity30014,
                  ),
                  TextFormField(
                    enabled: false,
                    style: stBlack40016,
                    initialValue: userDetail.name,
                    decoration: borderTextInputDecoration,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email Address',
                    style: stBlackWithOpacity30014,
                  ),
                  TextFormField(
                    style: stBlack40016,
                    enabled: false,
                    initialValue: userDetail.email,
                    decoration: borderTextInputDecoration,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Phone Number',
                    style: stBlackWithOpacity30014,
                  ),
                  TextFormField(
                    style: stBlack40016,
                    enabled: false,
                    initialValue: '${userDetail.phone}',
                    decoration: borderTextInputDecoration,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
