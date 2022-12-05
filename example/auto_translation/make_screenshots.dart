import 'dart:io';

import 'package:emulators/emulators.dart';
import 'package:auto_screenshot_translate/callable/core_my/my_language_code/entity/flutter_support_language_for_screenshot.dart';

Future<void> main() async {
  // Create the config instance
  final emu = await Emulators.build();

  // Shutdown all the running emulators
  await emu.shutdownAll();

  // var locals = [
  //   {'locale': 'ko'},
  //   {'locale': 'en'}
  // ];

  var locals = flutterLocalizeSupportLanguagesForScreenShot;

  // For each emulator in the list, we run `flutter drive`.
  await emu.forEach([
    'nexus_9',
    'Samsung_Galaxy_S10',
    'iPhone 8 Plus',
    'iPhone 8',
    'iPad Pro (12.9-inch) (5th generation)',
    'iPhone 13 Pro Max',
  ])((device) async {
    for (final c in locals) {
      final p = await emu.drive(
        device,
        'test_driver/main.dart',
        config: c,
      );
      stderr.addStream(p.stderr);
      await stdout.addStream(p.stdout);
    }
  });
}
