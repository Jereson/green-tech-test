import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/views/screens/account_screen.dart';
import 'package:green_tech_app/views/screens/home_screen.dart';
import 'package:green_tech_app/views/screens/my_cart_screen.dart';

class BottomNavPage extends StatefulWidget {
  static const routeName = 'bottom-nav';
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyItems[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: false,
        iconSize: 30,
        height: 55,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(
              Icons.home_filled,
              color: kcPrimaryColor.withOpacity(0.4),
            ),
            activeColor: kcPrimaryColor,
            // inactiveColor: kcPrimaryColor.withOpacity(0.2),
            title: Text('Home',
                style: stBlack50015.copyWith(color: kcPrimaryColor)),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.shopping_cart_checkout,
              color: kcPrimaryColor.withOpacity(0.4),
            ),
            activeColor: kcPrimaryColor,
            // inactiveColor: kcPrimaryColor.withOpacity(0.2),
            title: Text('Cart',
                style: stBlack50015.copyWith(color: kcPrimaryColor)),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.receipt_long_outlined,
              color: kcPrimaryColor.withOpacity(0.4),
            ),
            activeColor: kcPrimaryColor,
            // inactiveColor: kcPrimaryColor.withOpacity(0.2),
            title: Text('Transaction',
                style: stBlack50015.copyWith(color: kcPrimaryColor)),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.person_add_alt,
              color: kcPrimaryColor.withOpacity(0.4),
            ),
            activeColor: kcPrimaryColor,
            // inactiveColor: kcPrimaryColor.withOpacity(0.2),
            title: Text('Profile',
                style: stBlack50015.copyWith(color: kcPrimaryColor)),
          ),
        ],
      ),
    );
  }

  List<Widget> bodyItems = const [
    HomeScreen(),
    MyCartScreen(),
    Center(
      child: Text('Transaction'),
    ),
   AccountScreen(),
  ];
}
