import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/utils/image_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/views/screens/product_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey,
          )
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(20.0), children: [
        TextField(
          decoration: borderTextInputDecoration.copyWith(
              filled: false, hintText: 'Type here to start search'),
        ),
        const SizedBox(),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ProductDetailScreen.routeName);
                },
                child: Card(
                  shadowColor: Colors.grey.withOpacity(0.6),
                  elevation: 2.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 12.0),
                        alignment: Alignment.bottomCenter,
                        height: 100.0,
                        width: 100,
                        child: Image.asset(
                          imgLogo,
                          fit: BoxFit.contain,
                        ),
                      ),

                      //Product Detial
                      SizedBox(height: 18.0),
                      Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'eurhuheruhturhtu',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                            Text('iijrtrtht', style: st90909030012),
                            Text(
                              'nu guhrughrtu hg utg rtuhg',
                              style: st90909030012,
                            ),
                          ],
                        ),
                      ),

                      //Product price
                      Container(
                        padding: EdgeInsets.only(
                            top: 12.0, right: 10.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 26.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF909090),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '\$345',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ProximaNova',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.8 / 6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        )
      ]),
    );
  }
}
