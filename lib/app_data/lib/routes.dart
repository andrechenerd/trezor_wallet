import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trezor_wallet_desktop/features/auth/presentation/import/import_phrase.dart';
import 'package:trezor_wallet_desktop/features/auth/presentation/status/status.dart';
import 'package:trezor_wallet_desktop/features/init/presentation/init.dart';

import '../../features/auth/presentation/welcome/welcome.dart';

import '../app_data.dart';

final _routes = RoutesList();

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

class RoutesList {
  final String init = '/';

  // PincodeScrren
  String get _pincodeScreenName => 'pincodeScreen';
  String get pincodeScreen => '$init$_pincodeScreenName';

  // WelcomeScreens
  String get _welcomeScreenName => 'welcome';
  String get welcomeScreen => '$init$_welcomeScreenName';

  // Import Key screen
  String get _importKeyScreenName => 'importKeyScreen';
  String get importKeyScreen => '$welcomeScreen/$_importKeyScreenName';

  // StatusScreens
  String get _statusScreenName => 'statusScreen';
  String get statusScreen => '$importKeyScreen/$_statusScreenName';

  // Tx App

  String get _txAppScreenName => 'txAppScreen';
  String get txAppScreen => '$init$_txAppScreenName';
}

class Routes {
  Routes();

  String init = AppData.routes.txAppScreen;

  late final GoRouter routerConfig = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: AppData.routes.welcomeScreen,
    routes: [
      // GoRoute(
      //   path: AppData.routes.init,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const InitPage();
      //   },
      //   routes: [

      //   ],
      // ),
      GoRoute(
        path: AppData.routes.welcomeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
        routes: [
          GoRoute(
            path: AppData.routes._importKeyScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const ImportKeyScreen();
            },
            routes: [
              GoRoute(
                path: AppData.routes._statusScreenName,
                builder: (BuildContext context, GoRouterState state) {
                  return StatusScreen(
                    status: state.extra as bool,
                  );
                },
                routes: const [],
              ),
            ],
          ),
        ],
      ),
      // GoRoute(
      //   path: AppData.routes.txAppScreen,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SplashScreen();
      //   },
      // ),
    ],
  );
}
