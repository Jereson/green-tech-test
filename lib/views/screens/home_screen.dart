import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/utils/string_util.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/cart_vm.dart';
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
        actions: const [
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
            return pVm.cachedProductModel == null
                ? const CustomLoader()
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                decoration: BoxDecoration(
                                    color: kcPrimaryColor.withOpacity(0.1)),
                                child: Text(
                                  'N${pVm.userDetailModel!.data!.balance!}'
                                      .replaceAllMapped(reg, addCommaToString),
                                  style: stPrimaryColor60015,
                                )),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                //Top with 3000 naira
                                //This feature is testing crediti card
                                getIt
                                    .get<CartViewModel>()
                                    .initiatePayment(context, '3000');
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: kcPrimaryColor.withOpacity(0.1)),
                                  child: const Text(
                                    'Top up [N3000]',
                                    style: stPrimaryColor60015,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: pVm.searchController,
                          decoration: borderTextInputDecoration.copyWith(
                              hintText: 'Type here to search'),
                          onTap: () => pVm.changeSearchVisibilty(true, ''),
                          onChanged: (val) {
                            if (val.trim().isEmpty) {
                              pVm.changeSearchVisibilty(true, '');
                              return;
                            }
                            pVm.changeSearchVisibilty(false, val.trim());
                          },
                          onTapOutside: (val) {
                            pVm.searchController.clear();
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        const SizedBox(height: 20),
                        GridView.builder(
                          shrinkWrap: true,
                          // itemCount:
                          //     pVm.cachedProductModel!.productData!.length,
                          itemCount: pVm.getAllProductList()!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product = pVm.getAllProductList()![index];
                            // pVm.cachedProductModel!.productData![index];
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
                                    ),

                                    //Product Detial
                                    const SizedBox(height: 18.0),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name!,
                                            style:stBlack70014
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
                                      padding: const EdgeInsets.only(
                                          top: 12.0, right: 10.0, bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 26.0,
                                            width: 70.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF909090),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              'N${product.price}',
                                              style: stWhite40012
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
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 4 / 6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                        )
                      ]);
          }),
    );
  }
}
