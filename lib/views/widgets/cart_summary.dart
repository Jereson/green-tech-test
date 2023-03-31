import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/model/my_cart_model.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/utils/image_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/cart_vm.dart';
import 'package:green_tech_app/views/widgets/custom_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CartSummary extends StatefulWidget {
  final Products? products;
  const CartSummary({super.key, required this.products});

  @override
  // ignore: library_private_types_in_public_api
  _CartSummaryState createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<CartViewModel>(
        model: getIt(),
        builder: (cVm, _) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                child: ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    width: 75.0,
                    child: Row(
                      children: [
                        !_expanded
                            ? clipRrectImage(widget)
                            : const SizedBox.shrink(),
                        const Spacer(),
                        Text(
                          '${widget.products!.quantity!}X',
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    widget.products!.name!, //Contstitution
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(widget.products!.brand!, //Title
                      style: TextStyle(color: Colors.black, fontSize: 12.0)),
                  trailing: Text(
                    'N${widget.products!.price!}', //Total price
                    style: stBlack70016,
                  ),
                ),
              ),
              _expanded
                  ? Container(
                      padding: const EdgeInsets.only(right: 10, left: 15.0),
                      height: 50.0,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: kcPrimaryColor,
                            ),
                            onPressed: () {},
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showOperationModel(
                                        'remove',
                                        widget.products!.id!.id!,
                                        widget.products!.quantity!);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: kcPrimaryColor,
                                    // size: 30,
                                  ),
                                ),
                                Text('${widget.products!.quantity!}',
                                    style: stBlack70016),
                                IconButton(
                                  onPressed: () {
                                    showOperationModel(
                                        'add',
                                        widget.products!.id!.id!,
                                        widget.products!.quantity!);
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: kcPrimaryColor,
                                    // size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          );
        });
  }

  void showOperationModel(
      String operationType, String productId, int quantity) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) {
          return OperationModal(
            operationType: operationType,
            productId: productId,
            quantity: quantity,
          );
        });
  }
}

//Image in ClipRRect
Widget clipRrectImage(widget) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Image.asset(
        imgLogo,
        fit: BoxFit.fill,
      ),
    ),
  );
}

class OperationModal extends StatefulWidget {
  final String operationType;
  final String productId;
  final int quantity;
  const OperationModal(
      {super.key,
      required this.operationType,
      required this.productId,
      required this.quantity});

  @override
  State<OperationModal> createState() => _OperationModalState();
}

class _OperationModalState extends State<OperationModal> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: kcPrimaryColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.operationType} item'.toUpperCase()),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: borderTextInputDecoration.copyWith(
                        hintText: 'Enter amount to ${widget.operationType}'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Field required';
                      } else if (num.tryParse(value)! <= 0 || value[0] == '0') {
                        return 'Invalid amount';
                      } else if (widget.operationType == 'remove' &&
                          int.tryParse(value.trim())! >= widget.quantity) {
                        return 'You cannot remove $value from ${widget.quantity} quntity(s)';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kcPrimaryColor, // Background color
                          ),
                          onPressed: () {
                            if (!formKey.currentState!.validate()) return;
                            if (widget.operationType == 'remove') {
                              getIt.get<CartViewModel>().removeProctFromCart(
                                  context, widget.productId, widget.quantity);
                            } else {
                              getIt.get<CartViewModel>().addProductToCart(
                                  context, widget.productId, widget.quantity);
                            }
                          },
                          child: Text(
                              '${widget.operationType} Item'.toUpperCase())))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
