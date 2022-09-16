import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neyasischallenge/core/init/lang/language_manager.dart';
import 'package:neyasischallenge/core/service/locator/locator.dart';
import 'package:neyasischallenge/env.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(EasyLocalization(
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: Environment.LANGUAGE_ASSET_PATH,
    startLocale: LanguageManager.instance.trLocale,
    child: await builder(),
  ));
}
