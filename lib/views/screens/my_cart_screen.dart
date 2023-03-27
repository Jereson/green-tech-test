import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/views/widgets/cart_summary.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kcPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcPrimaryColor,
        elevation: 0.0,
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 4.0),
          Text('Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0))
        ]),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child:
                CircleAvatar(backgroundColor: Colors.white, child: Text('45')),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 40.0,
            // width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: kcPrimaryColor.withOpacity(0.2),
              // borderRadius: BorderRadius.circular(12.0)
            ),
            child: const Text(
              'Tab an item for add, remove, delete option',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (ctx, i) => CartSummary(),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        color: kcPrimaryColor.withOpacity(0.8),
        height: 47.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: stWhite60018,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Order Now', style: stWhite60018),
                ),
                Text(
                  '\$23456',
                  style: stWhite60018,
                ),
              ],
            ),
            // SizedBox(height: 16.0),
            // Container(
            //   height: 44.0,
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(14.0),
            //     color: Colors.white,
            //   ),
            //   child: TextButton(
            //       onPressed: () {},
            //       child: Text('Checkout',
            //           style: TextStyle(
            //               fontWeight: FontWeight.bold, fontSize: 16.0))),
            // ),
          ],
        ),
      ),
    );
  }
}
