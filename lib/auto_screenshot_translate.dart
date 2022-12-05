library auto_screenshot_translate;

import 'package:auto_screenshot_translate/callable/core_my/my_screenshot_helper/entity/my_screenshot_info.dart';

import 'callable/core_my/my_screenshot_helper/spell.dart';

class AutoScreenshotTranslate {

  static Future removeUnderBarInGalaxy() async {
    await MyScreenshotHelperSpell().removeUnderBarInGalaxy();
  }

  static Future prepareGenerateScreenshotFrame(MyScreenshotInfo myScreenshotInfo) async {
    await MyScreenshotHelperSpell().prepareGenerateScreenshotFrame(myScreenshotInfo);
  }

  static Future distributeScreenshotFrameFile() async {
    await MyScreenshotHelperSpell().distributeScreenshotFrameFile();
  }

}