import 'dart:developer';

import 'package:flutter/material.dart';

class AppUtil {
  static String appName = "JFleet";
  static var appVersion = "1.0.2";

  static var isDebug = true;

// - - - - - - - APP Colors
  static Color appprimaryclr = const Color(0xff47339C);
  static Color appscecondaryclr = const Color(0xff897EBA);
  static Color disabledclr = const Color(0xffF3F2F6);

  static Color appbtnclr = const Color(0xffFFBF1E);
  static Color appclrwhite = Colors.white;
  static Color containerclr = const Color(0xffF0EDFE);

// - - - - - - - App TextStyles

  // static TextStyle bttntxt = GoogleFonts.poppins(
  //   textStyle: const TextStyle(
  //       color: Color(0xff272727),
  //       fontSize: 22,
  //       letterSpacing: .5,
  //       fontWeight: FontWeight.w500),
  // );
}

class Log {
  static void print(dynamic msg, {other}) {
    // if (AppUtil.isDebug) {
    debugPrint("${other ?? ""} ${msg.toString()}");
    log("${other ?? ""} ${msg.toString()}");
    // }
  }
}

String assetImages(String imagename) {
  return 'assets/images/$imagename';
}
