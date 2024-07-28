import 'dart:developer';

import 'package:flutter/material.dart';

class AppUtil {
  static String appName = "JFleet";
  static var appVersion = "1.0.2";

  static var isDebug = true;

// - - - - - - - APP Colors
  static Color appprimaryclr = const Color(0xffabc8bf);
  static Color appscecondaryclr = const Color(0xffd8eafc);
  static Color appclr3 = const Color(0xfffee1dc);
  static Color appclr4 = const Color(0xfffef2d9);

  static Size screensize(context) {
    var size = MediaQuery.of(context).size;
    return size;
  }
}

String assetImages(String imagename) {
  return 'assets/images/$imagename';
}

String assetSvg(String imagename) {
  return 'assets/svgicons/$imagename';
}

class Log {
  static void print(dynamic msg, {other}) {
    // if (AppUtil.isDebug) {
    debugPrint("${other ?? ""} ${msg.toString()}");
    log("${other ?? ""} ${msg.toString()}");
    // }
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return "Good Morning";
  }
  if (hour < 17) {
    return "Good Afternoon";
  }

  return "Good Evening";
}

CircularProgressIndicator commonloading() {
  return CircularProgressIndicator(
    color: AppUtil.appprimaryclr,
  );
}

Container pageHead(pageHead) {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$pageHead",
          style: textStyle(
              font: 28.0, clr: Colors.black, ftWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

TextStyle textStyle({font, clr, FontWeight? ftWeight}) {
  return TextStyle(
      color: clr ?? Colors.black,
      fontSize: font,
      letterSpacing: .5,
      fontWeight: ftWeight);
}

AppBar commonAppBar(context, {ontap}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    automaticallyImplyLeading: true,
    leading: GestureDetector(
        onTap: ontap ??
            () {
              Navigator.pop(context);
            },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 28,
        )),
  );
}

class FromSubjectPage {
  String? subject;
  String? teacher;
  FromSubjectPage({required this.subject, required this.teacher});
}
