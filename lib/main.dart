import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/network/network_api_service.dart';
import 'package:studentapp/repository/api_repository.dart';
import 'package:studentapp/utils/app_utils.dart';

import 'package:studentapp/view/splash.dart';
import 'package:studentapp/view_model/classroom_model/calssroom_controller.dart';

import 'package:studentapp/view_model/home_model/home_controller.dart';
import 'package:studentapp/view_model/students_model/students_controller.dart';
import 'package:studentapp/view_model/subject_model/subject_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiRepo = ApiRepository(NetworkApiService(context: context));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
            create: (_) => HomeController(apiRepository: apiRepo)),
        ChangeNotifierProvider<CalssroomController>(
            create: (_) => CalssroomController(apiRepository: apiRepo)),
        ChangeNotifierProvider<StudentsController>(
            create: (_) => StudentsController(apiRepository: apiRepo)),
        ChangeNotifierProvider<SubjectsController>(
            create: (_) => SubjectsController(apiRepository: apiRepo)),
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        color: AppUtil.appprimaryclr,
        builder: (context, child) {
          final data = MediaQuery.of(context);

          return MediaQuery(
              data: data.copyWith(textScaler: const TextScaler.linear(0.8)),
              child: child!);
        },
      ),
    );
  }
}
