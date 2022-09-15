import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neyasischallenge/bootstrap.dart';
import 'package:neyasischallenge/core/init/router/app_router.dart';
import 'package:neyasischallenge/core/service/locator/locator.dart';
import 'package:neyasischallenge/env.dart';

void main() => bootstrap(() => NeyasisChallengeApp());

class NeyasisChallengeApp extends StatelessWidget {
  final _appRouter = getIt<AppRouter>();
  NeyasisChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Environment.APPLICATION_NAME,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: AutoRouterDelegate(_appRouter),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
