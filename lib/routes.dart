import 'package:flutter/material.dart';
import 'package:green_tech_app/views/screens/auth/signin_screen.dart';
import 'package:green_tech_app/views/screens/auth/signup_screen.dart';
import 'package:green_tech_app/views/screens/edit_profile.dart';
import 'package:green_tech_app/views/screens/nav_screen.dart';
import 'package:green_tech_app/views/screens/product_detail.dart';

final routes = <String, WidgetBuilder>{
   BottomNavPage.routeName:(_) =>const BottomNavPage(),
  SigninScreen.routeName:(_) =>const SigninScreen(),
  SignupScreen.routeName:(_) =>const SignupScreen(),
  ProductDetailScreen.routeName:(_)=>const ProductDetailScreen(),
  EditProfileScreen.routeName:(_)=>const EditProfileScreen()
 
};
