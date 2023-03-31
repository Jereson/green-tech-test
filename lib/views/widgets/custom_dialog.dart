import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';

showSuccess(
    {required BuildContext? context,
    required String title,
    required String btnText,
    required VoidCallback callback,
    bool isCancel=true,
    Color? textColor}) {
  showDialog(
      context: context!,
      builder: (context) {
        return Dialog(
          child: SuccessDialog(
            title: title,
            buttonText: btnText,
            callback: callback,
            isCancel: isCancel,
            titleColor: textColor,
          ),
        );
      });
}

class SuccessDialog extends StatelessWidget {
  final String? title;
  final String? buttonText;
  final Color? titleColor;
  final VoidCallback? callback;
  final bool? isCancel;
  const SuccessDialog(
      {Key? key,
      this.title,
      this.buttonText,
      this.callback,
      this.titleColor = kcPrimaryColor, this.isCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 167,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title!,
            style: stNoColor50014.copyWith(color: titleColor),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            isCancel! ?  TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel',
                    style: stNoColor50014.copyWith(color: kcBlack)),
              ):const SizedBox.shrink(),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: callback,
                child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 113,
                    decoration: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(buttonText!,
                        textAlign: TextAlign.center,
                        style: stNoColor50014.copyWith(color: kcWhite))),
              )
            ],
          )
        ],
      ),
    );
  }
}
