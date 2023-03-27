import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/routes.dart';
import 'package:green_tech_app/views/screens/auth/signin_screen.dart';
import 'package:green_tech_app/views/screens/home_screen.dart';
import 'package:green_tech_app/views/screens/nav_screen.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await setup();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GreenTech',
      home: const SigninScreen(),
      // home: BottomNavPage(),
      routes: routes,
    );
  }
}
