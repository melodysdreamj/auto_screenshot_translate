import 'package:auto_screenshot_translate/auto_screenshot_translate.dart';
import 'package:auto_screenshot_translate/callable/core_my/my_screenshot_helper/entity/my_screenshot_info.dart';

Future<void> main() async {
  MyScreenshotInfo myScreenshotInfo = MyScreenshotInfo(
    // not use
    screenshotTitle01: "",
    screenshotTitle02: "",
    screenshotTitle03: "",
    screenshotTitle04: "",
    screenshotTitle05: "",

    // using (screenshot top text)
    screenshotSubTitle01: "hello world",
    screenshotSubTitle02: "I love you",
    screenshotSubTitle03: "be happy",
    screenshotSubTitle04: "do your best",
    screenshotSubTitle05: "you are the best",

    // screenshot start language for translate
    screenshotStartLanguageCode: "en",

    googleTranslateApiKey: "INPUT_YOUR_GOOGLE_TRANSLATE_API_KEY",
  );

  AutoScreenshotTranslate.prepareGenerateScreenshotFrame(myScreenshotInfo);
}
