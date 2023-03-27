import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/image_utils.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _counter = 1;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _itemSize = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13.0,
    );

    const _headings = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
      color: Color(0xFF909090),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.circular(10.0)),
              // height: 30,
              width: 54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  Text(
                    '6',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                height: 140.0,
                width: double.infinity,
                child: Image.asset(
                  imgLogo,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 18.0),
              Text(
                'rjgnrjngjtrnghjt',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'mdkrgh erugh  uerfhguher ghrug urgrrhgyre g ra',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 22.0),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color(0xFF909090),
                    radius: 23.0,
                  ),
                  SizedBox(width: 18.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'SOLD BY',
                        style: TextStyle(
                          color: Color(0xFF909090),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const Text(
                        'Green Tech Comm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 22.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        margin: const EdgeInsets.only(right: 6.0),
                        height: 40.0,
                        width: 105.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF909090),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              // onTap: () => ,
                              child: Icon(
                                Icons.remove,
                                color: _counter == 0
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              '$_counter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            InkWell(
                              // onTap: () => increaseQuatityadPrice(),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Pack(s)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: Color(0xFF909090),
                        ),
                      ),
                    ],
                  ),

                  //Product Price
                  Text(
                    '\$8494',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.0),
              const Text(
                'PRODUCT DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  color: Color(0xFF909090),
                ),
              ),
              SizedBox(height: 6.0),
              //Pack Size, Product in Row
              Container(
                width: MediaQuery.of(context).size.width * .78,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Prize Size
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.label_outline,
                            color: kcPrimaryColor,
                            size: 32.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'PACK SIZE',
                              style: _headings,
                            ),
                            Text(
                              '2',
                              style: _itemSize,
                            )
                          ],
                        ),
                      ],
                    ),

                    //Product ID
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.dashboard,
                            color: kcPrimaryColor,
                            size: 40.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('PRODUCT ID', style: _headings),
                            Text(
                              'nejfnrjgr',
                              style: _itemSize,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Constituents
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.label,
                      color: kcPrimaryColor,
                      size: 32.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'CONSTITUENTS',
                        style: _headings,
                      ),
                      Text(
                        'nejeiu enrj',
                        style: _itemSize,
                      )
                    ],
                  ),
                ],
              ),

              //Dispensed
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.delete_outline,
                      color: kcPrimaryColor,
                      size: 35.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('DISPENSE', style: _headings),
                      Text(
                        'ejnejrijri4',
                        style: _itemSize,
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 14.0),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  '1 shirt of ehbfhrbg  contain 39 ',
                  style: TextStyle(color: Color(0xFF909090)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          
        },
        child: Container(
          height: 40.0,
          width: MediaQuery.of(context).size.width * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: kcPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              SizedBox(width: 10.0),
              const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
