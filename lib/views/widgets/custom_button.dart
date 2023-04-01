import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final bool isPadding;
  final double? height;
  final double? width;
  final Color color;
  final bool isLoading;
  const CustomButtonWidget(
      {Key? key,
      required this.title,
      required this.callback,
      this.isPadding = false,
      this.height,
      this.width,
      this.color = kcPrimaryColor,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : callback,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: kcPrimaryColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 10),
            isLoading
                ? const SpinKitWave(color: kcWhite, size: 40)
                : Text(
                    title,
                    style: btnStyle,
                  ),
            const Icon(
              Icons.arrow_forward,
              color: kcWhite,
            )
          ],
        ),
      ),
    );
  }
}
