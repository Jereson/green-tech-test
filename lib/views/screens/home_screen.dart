import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/product_view_model.dart';
import 'package:green_tech_app/views/screens/product_detail.dart';
import 'package:green_tech_app/views/widgets/custom_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        centerTitle: true,
        title: Text(
          'GreenTech Mall',
          style: stBlack50016.copyWith(color: kcWhite),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey,
          )
        ],
      ),
      body: BaseViewBuilder<ProductViewModel>(
          model: getIt(),
          initState: (init) async {
            await init.catchedUserDetail();

            init.getAllProduct();
          },
          builder: (pVm, _) {
            return ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                children: [
                  TextField(
                    decoration: borderTextInputDecoration.copyWith(
                        hintText: 'Type here to search'),
                  ),
                  const SizedBox(height: 20),
                  pVm.cachedProductModel == null
                      ? const CustomLoader()
                      : GridView.builder(
                          shrinkWrap: true,
                          itemCount:
                              pVm.cachedProductModel!.productData!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product =
                                pVm.cachedProductModel!.productData![index];
                            return GestureDetector(
                              onTap: () {
                                pVm.setSelectProduct(product);
                                Navigator.of(context)
                                    .pushNamed(ProductDetailScreen.routeName);
                              },
                              child: Card(
                                shadowColor: Colors.grey.withOpacity(0.6),
                                elevation: 2.0,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: kcPrimaryColor, width: 2)),
                                      child: CachedNetworkImage(
                                        imageUrl: product.image!,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            const CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.broken_image),
                                        fit: BoxFit.cover,
                                      ),
                                      // Image.asset(
                                      //   imgLogo,
                                      //   fit: BoxFit.contain,
                                      // ),
                                    ),

                                    //Product Detial
                                    const SizedBox(height: 18.0),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            product.name!,
                                            style: TextStyle(
                                              fontFamily: 'ProximaNova',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          Text(product.brand!,
                                              style: st90909030012.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            product.description!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            height: 26.0,
                                            width: 70.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF909090),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              'N${product.price}',
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
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.8 / 6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                        )
                ]);
          }),
    );
  }
}
