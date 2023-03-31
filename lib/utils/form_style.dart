import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';

const underline =
    UnderlineInputBorder(borderSide: BorderSide(color: kcECECEC, width: 1.4));
// const borderTextInputDecoration = InputDecoration(
//     enabledBorder: underline, focusedBorder: underline, border: underline);

final borderTextInputDecoration = InputDecoration(
  filled: true,
  fillColor: kcPrimaryColor.withOpacity(0.1),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: kc818785),
  ),
  contentPadding: const EdgeInsets.all(12),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: kcF0F2F6),
  ),
  border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1, color: kc818785)),
  hintStyle: TextStyle(fontSize: 16, color: kc2B2C43.withOpacity(0.56)),
);


// final underlineInputDecoration = InputDecoration(
//     hintStyle: st2B2C4340016,
//     enabledBorder: underline,
//     focusedBorder: underline,
//     border: underline);
// final borderTextInputDecoration2 = InputDecoration(
//   filled: true,
//   fillColor: kcF0F2F6,
//   focusedBorder: const OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//     borderSide: BorderSide(width: 1, color: kc818785),
//   ),
//   contentPadding: const EdgeInsets.all(12),
//   enabledBorder: const OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//     borderSide: BorderSide(width: 1, color: kcF0F2F6),
//   ),
//   border: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       borderSide: BorderSide(width: 1, color: kc818785)),
//   hintStyle: TextStyle(fontSize: 16, color: kc2B2C43.withOpacity(0.56)),
// );
