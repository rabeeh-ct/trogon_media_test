import 'package:flutter/material.dart';

const defaultPadding = 20.0;

const primaryColor = Color(0xFF512E7E);
const secondaryColor = Color(0xFFF2E8F5);
const primaryColorLight = Color(0xFFA073DA);
const lightGrey = Color(0xFFF2E8F5);
const yellowColor = Color(0xFFF9B93C);
const lightYellowColor = Color(0xFFF6EAB6);
const whiteColor = Colors.white;
const greyColor = Color(0xff959595);
const errorColor = Color(0xFFFC4444);
const blackColor = Color(0xff000000);

const defaultShadow = [
  BoxShadow(
    color: Colors.black26,
    // offset: Offset(2, 5),
    spreadRadius: 4,
    blurRadius: 30,
  )
];

extension Sizedbox on num {
  SizedBox get sBH => SizedBox(height: toDouble());
  SizedBox get sBW => SizedBox(width: toDouble());
}

extension StringExtension on String{
  String get upperFirst=>"${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

// extension SampleText on String {
//   Text get errorText => Text(toString(),style: const TextStyle(color: Colors.red),);
// }