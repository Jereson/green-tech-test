import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:green_tech_app/utils/color_utils.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const Center(
    //   child: SpinKitThreeInOut(
    //     color: kcPrimaryColor,
    //     size: 50.0,
    //   ),
    // );

    return Center(
        child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                color: kcPrimaryColor, borderRadius: BorderRadius.circular(10)),
            child: const SpinKitDualRing(
              color: kcWhite,
            )));
  }
}
