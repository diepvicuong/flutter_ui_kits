import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'sizes.dart';

class AppStyle {
  static final petTypeTextStyle = GoogleFonts.mavenPro(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w200);

  static final petNameTextStyle = GoogleFonts.mavenPro(
      fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.normal);

  static final petAgeTextStyle = GoogleFonts.mavenPro(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: Color(0xffA9A9A9),
  );

  static final adoptionTextStyle = petAgeTextStyle.copyWith(fontSize: 20.0);

  static final whiteBoxDecoration = BoxDecoration(
      color: AppColor.kSecondaryColor,
      borderRadius: BorderRadius.circular(AppSize.commonBorderRadius));

  static final primaryBoxDecoration = BoxDecoration(
      color: AppColor.kprimaryColor,
      borderRadius: BorderRadius.circular(AppSize.commonBorderRadius));
}
