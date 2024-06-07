
import 'package:flutter/material.dart';
import 'package:studentapp/utils/Utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUtil.appprimaryclr,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
