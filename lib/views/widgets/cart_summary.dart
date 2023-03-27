import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/image_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';

class CartSummary extends StatefulWidget {
  const CartSummary({super.key});

  @override
  _CartSummaryState createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
                children: <Widget>[
                  !_expanded ? clipRrectImage(widget) : const SizedBox.shrink(),
                  const Spacer(),
                  Text(
                    '3X',
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            title: Text(
              'jfbhbhr fj', //Contstitution
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            subtitle: Text('Rise', //Title
                style: TextStyle(color: Colors.black, fontSize: 12.0)),
            trailing: Text(
              '\$299', //Total price
              style: stBlack70016,
            ),
          ),
        ),
        _expanded ? expandedWidget(context, widget) : const SizedBox.shrink()
      ],
    );
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

//Expanded Widget
Widget expandedWidget(BuildContext context, widget) {
  return Container(
    padding: EdgeInsets.only(right: 10, left: 15.0),
    height: 50.0,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: kcPrimaryColor,
          ),
          onPressed: () {},
        ),
        Spacer(),
        Container(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(
                Icons.remove_circle,
                color: kcPrimaryColor,
                // size: 38,
              ),
              Text('1', style: stBlack70016),
              const Icon(
                Icons.add_circle,
                color: kcPrimaryColor,
                // size: 30,
              )
            ],
          ),
        ),
      ],
    ),
  );
}
