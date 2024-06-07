

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/network/NetworkApiService.dart';
import 'package:studentapp/repository/api_repository.dart';
import 'package:studentapp/utils/Utils.dart';
import 'package:studentapp/utils/app_routes.dart';
import 'package:studentapp/view/splash.dart';
import 'package:studentapp/view_model/home/MoviesListVM.dart';

void main() {
  runApp(const MyApp());
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context,
      required GoRouterState state,
      required Widget child,
      required String type}) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child);
            case 'rotation':
              return RotationTransition(turns: animation, child: child);
            case 'size':
              return SizeTransition(sizeFactor: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}

final GoRouter _router = GoRouter(
  initialLocation: AppRoutes.splash,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
        pageBuilder: (context, state) {
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const SplashScreen(),
            type: 'fade',
          );
        }),

    // ShellRoute(
    //   navigatorKey: _shellNavigatorKey,
    //   pageBuilder: (context, state, child) {
    //     return NoTransitionPage(
    //         child: Dashboard(
    //       child: child,
    //     ));
    //   },
    //   routes: [

    //     GoRoute(
    //         path: AppRoutes.viewVehicleDet,
    //         parentNavigatorKey: _shellNavigatorKey,
    //         builder: (context, state) {
    //           return const ViewVehicleDetails();
    //         },
    //         pageBuilder: (context, state) {
    //  FromPage args = state.extra as FromPage;
    //           return RouterTransitionFactory.getTransitionPage(
    //             context: context,
    //             state: state,
    //             child: const ViewVehicleDetails(
    //
    //
    //
    //  arguments: args,),
    //             type: 'fade',
    //           );
    //         }),

    //   ],
    // ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiRepo = ApiRepository(NetworkApiService(context: context));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoviesListVM>(
            create: (_) => MoviesListVM(apiRepository: apiRepo)),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        color: AppUtil.appprimaryclr,
        routerConfig: _router,
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
