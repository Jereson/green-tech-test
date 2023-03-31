import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/viewModel/cart_vm.dart';
import 'package:green_tech_app/viewModel/product_view_model.dart';
import 'package:green_tech_app/views/widgets/custom_dialog.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
    final productData = getIt.get<ProductViewModel>().selectedProduct;

    return BaseViewBuilder<CartViewModel>(
        model: getIt(),
        initState: (init) async {
          await init.resetDataOnInit();
          init.setInitTotalPrice(productData!.price!);
        },
        builder: (cVm, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: [
                Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    // height: 30,
                    width: 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.shopping_cart),
                        Text(
                          '${cVm.cartCount}',
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
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      alignment: Alignment.center,
                      height: 140.0,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: productData!.image!,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    Text(
                      productData.name!,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      productData.description!,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w400),
                    ),

                    SizedBox(height: 22.0),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFF909090),
                          radius: 23.0,
                        ),
                        SizedBox(width: 18.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'SOLD BY',
                              style: TextStyle(
                                color: Color(0xFF909090),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              productData.brand!.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 22.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 4.0),
                              margin: const EdgeInsets.only(right: 6.0),
                              height: 40.0,
                              // width: 120.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF909090),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cVm.decreamentItemCount(
                                            productData.price!);
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: cVm.itemCount == 0
                                            ? Colors.grey.withOpacity(0.4)
                                            : Colors.black,
                                      )),
                                  // InkWell(
                                  //   // onTap: () => ,
                                  //   child: Icon(
                                  //     Icons.remove,
                                  //     color: cVm.itemCount == 0
                                  //         ? Colors.grey.withOpacity(0.4)
                                  //         : Colors.black,
                                  //   ),
                                  // ),
                                  Text(
                                    '${cVm.itemCount}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cVm.increamentItemCount(
                                            productData.price!);
                                      },
                                      icon: Icon(Icons.add)),
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
                          '[N${productData.price}]\n N${cVm.totalPrice}',
                          style: TextStyle(
                            fontSize: 16.0,
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
                        children: [
                          //Prize Size
                          Row(
                            children: [
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
                                children: [
                                  const Text(
                                    'PACK SIZE',
                                    style: _headings,
                                  ),
                                  Text(
                                    '${cVm.itemCount}',
                                    style: _itemSize,
                                  )
                                ],
                              ),
                            ],
                          ),

                          //Product ID
                          Row(
                            children: [
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
                                children: [
                                  const Text('PRODUCT ID', style: _headings),
                                  Text(
                                    productData.id!.substring(0, 9),
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
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
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
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
                          children: [
                            const Text(
                              'BRAND',
                              style: _headings,
                            ),
                            Text(
                              productData.brand!.toUpperCase(),
                              style: _itemSize,
                            )
                          ],
                        ),
                      ],
                    ),

                    //Dispensed
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
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
                          children: [
                            const Text('DISPENSE', style: _headings),
                            Text(
                              'Go back',
                              style: _itemSize,
                            )
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 14.0),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'You are adding ${cVm.itemCount} pack of ${productData.name} worth the total price of ${cVm.totalPrice} ',
                        style: TextStyle(color: Color(0xFF909090)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: GestureDetector(
              onTap: () {
               
                cVm.addProductToCart(context, productData.id!,cVm.itemCount,);
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
                  children: [
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
        });
  }
}
