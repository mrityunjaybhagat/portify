import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFEAC109);
  static const Color secondaryColor = Color(0xFF3D3D3D);
  static const Color textColor = Color(0xFF3D3D3D);
  static const Color iconColor = Color(0xFFEAC109);
  static const Color inputBorderColor = Color(0xFFEAC109);
  static const Color inoutbg = Color(0xF3F7FB);
  static const Color lightGrey = Colors.grey;
  static const Color lightText = Color(0xCFCBD8);

  static const Color kWhite = Colors.white;
  final kTitleTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

//For Profile Page
Color kWhite = Colors.white;
Color kAppPrimaryColor = Colors.grey.shade200;
Color kLightBlack = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCL = Colors.grey.shade600;

const kSpacingUnit = 10;

final kTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

BoxDecoration avatarDecoration =
    BoxDecoration(shape: BoxShape.circle, color: kAppPrimaryColor, boxShadow: [
  BoxShadow(
    color: kWhite,
    offset: Offset(10, 10),
    blurRadius: 10,
  ),
  BoxShadow(
    color: kWhite,
    offset: Offset(-10, -10),
    blurRadius: 10,
  ),
]);
