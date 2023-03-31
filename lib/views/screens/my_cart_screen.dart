import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/cart_vm.dart';
import 'package:green_tech_app/views/widgets/cart_summary.dart';
import 'package:green_tech_app/views/widgets/custom_loader.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<CartViewModel>(
        model: getIt(),
        initState: (init) {
          init.getMyCart();
        },
        builder: (cVm, _) {
          return Scaffold(
            // backgroundColor: kcPrimaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kcPrimaryColor,
              elevation: 0.0,
              centerTitle: true,
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.shopping_cart, color: Colors.white),
                const SizedBox(width: 4.0),
                Text('My Cart', style: stBlack50016.copyWith(color: kcWhite))
              ]),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: cVm.cachedMyCartModel == null
                          ? const CupertinoActivityIndicator()
                          : Text(
                              '${cVm.cachedMyCartModel!.cartData!.products!.length}')),
                )
              ],
            ),
            body: ListView(
              children: [
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
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ),
                cVm.cachedMyCartModel == null
                    ? const CustomLoader()
                    : cVm.cachedMyCartModel!.cartData!.products!.isEmpty
                        ? Center(
                            child: Container(
                                height: 100,
                                alignment: Alignment.center,
                                child:
                                    const Text('No item in your cart bag yet')),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: cVm
                                .cachedMyCartModel!.cartData!.products!.length,
                            itemBuilder: (ctx, index) {
                              return CartSummary(
                                products: cVm.cachedMyCartModel!.cartData!
                                    .products![index],
                              );
                            },
                          ),
                const SizedBox(height: 20),
                if (cVm.cachedMyCartModel != null &&
                    cVm.cachedMyCartModel!.cartData!.products!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    color: kcPrimaryColor.withOpacity(0.8),
                    height: 47.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: stWhite60018,
                            ),
                            GestureDetector(
                              onTap: () => cVm.checkoutCart(
                                context,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: kcPrimaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text('Check out',
                                    style: stWhite60018),
                              ),
                            ),
                            Text(
                              'N${cVm.cachedMyCartModel!.cartData!.totalAmount}',
                              style: stWhite60018,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
