import 'package:flutter/material.dart';

import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
    return Scaffold(
      backgroundColor: AppUtil.appprimaryclr,
      body: const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      )),
    );
  }
}
