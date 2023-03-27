import 'package:flutter/material.dart';
import 'package:green_tech_app/views/screens/edit_profile.dart';

class SettingModel {
  final String? title;
  final IconData? iconn;
  final String? routeName;

  SettingModel({this.title, this.iconn, this.routeName});
}

List<SettingModel> settingData = [
  SettingModel(
      title: 'My Profile',
      iconn: Icons.person_rounded,
      routeName: EditProfileScreen.routeName
      ),
  // SettingModel(
  //     title: 'Delete User',
  //     iconn: Icons.notifications,
  //     ),
  SettingModel(title: 'Logout', iconn: Icons.logout_outlined),
];
