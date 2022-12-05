import 'package:auto_screenshot_translate/callable/core_my/my_language_code/entity/flutter_support_language_locale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:emulators/emulators.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() async {
  // Disable the 'debug' banner
  WidgetsApp.debugAllowBannerOverride = false;

  // Enable flutter driver
  enableFlutterDriverExtension();

  final locale = Environment.getString('locale');
  print('Device: ${Environment.device}');
  print('Locale: $locale');

  // Run the app. You could pass in `locale` here.
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: flutterLocalizeSupportLanguagesLocale,
        path: 'assets/localization.done.csv',
        assetLoader: CsvAssetLoader(), // <- this is the important part for app translation
        fallbackLocale: const Locale('en'),
        child: const MyApp()
    ),
  );
}
