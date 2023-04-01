
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/viewModel/cart_vm.dart';

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
  final quantyController = TextEditingController();
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
                    controller: quantyController,
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
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) return;
                            if (widget.operationType == 'remove') {
                              await getIt
                                  .get<CartViewModel>()
                                  .removeProctFromCart(
                                      context,
                                      widget.productId,
                                      int.tryParse(quantyController.text)!);

                              setState(() => quantyController.clear());
                            } else {
                              await getIt.get<CartViewModel>().addProductToCart(
                                  context,
                                  widget.productId,
                                  int.tryParse(quantyController.text)!);
                              setState(() => quantyController.clear());
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
