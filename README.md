# Auto App Translate

It is a library that translates apps into 80 languages and automates settings.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/melodysdren)

# How to Use?
## 0. preapre
you need to config [auto_app_translate](https://pub.dev/packages/auto_app_translate) and [auto_store_translate](https://pub.dev/packages/auto_store_translate) library first.

## 1. create android / ios emulator
it should be made to fit the size of the store. please refer [this link](https://appfollow.io/blog/app-store-and-google-play-screenshot-guidelines)
### android
1. open android studio
2. tools - Device Manager - Create Device - New Hardware Profile
   1. Samsung Galaxy S10 
      1. Device Name: Samsung Galaxy S10
      2. Screen - Resolution: 1440 x 3040
      3. click next until "Verify Configuration" step
      4. click "Show Advanced Settings"
      5. Emulated Performance - Boot option: Cold Boot
      6. Memory and Storage - Internal Storage: more then 2000MB
   2. nexus_9
      1. Device Name: nexus_9
      2. Screen - Resolution: 1536 x 2048
      3. click next until "Verify Configuration" step
      4. click "Show Advanced Settings"
      5. Emulated Performance - Boot option: Cold Boot
      6. Memory and Storage - Internal Storage: more then 2000MB
   3. Nexus_5X
      1. Device Name: Nexus_5X
      2. Screen - Resolution: 1080 x 1920
      3. click next until "Verify Configuration" step
      4. click "Show Advanced Settings"
      5. Emulated Performance - Boot option: Cold Boot
      6. Memory and Storage - Internal Storage: more then 2000MB

### ios
1. open xcode
   1. window in the menu bar 
   2. click "devices and simulators"
   3. click "Simulator" in the top left
   4. click "+" in the bottom left
   5. add
      1. iPhone 8
      2. iPhone 8 Plus
      3. iPad Pro (12.9-inch) (2rd generation)
      4. iPhone 13 Pro Max

## 2. set the gitingore.
- Because there are hundreds of images, you need to exclude those images from git.
```gitignore
/auto_translation/screenshots/
/auto_translation/framed/
/auto_translation/metadata/
```

## 3. Set the scene of the screenshot in the app
- before taking a screenshot, you need to set which screen to take a screenshot.
1. download [text_drive.zip](https://github.com/melodysdreamj/auto_screenshot_translate/files/10151335/test_driver.zip) file, and put it in the project root directory.
   - [text_drive.zip](https://github.com/melodysdreamj/auto_screenshot_translate/files/10151335/test_driver.zip)
<br/>
![](https://user-images.githubusercontent.com/21379657/205572412-098ff34d-498c-4d1c-ae2b-ba2f9e37dbe1.png)

- Please set the part you want to screenshot and insert the screenshot code. Please refer to the [official document](https://docs.flutter.dev/get-started/test-drive) for details.


2. create "auto_translate" directory in the project root directory.<br/>
![](https://user-images.githubusercontent.com/21379657/205582934-d8500e06-e918-49c8-b661-8801bff40848.png)

3. download [frameit-chrome.zip]() folder, and put it in the "auto_translate" directory.

4. create "make_screenshot.dart" file in the "auto_translate" directory and write the following code.
```dart
import 'dart:io';

import 'package:emulators/emulators.dart';
import 'package:auto_screenshot_translate/callable/core_my/my_language_code/entity/flutter_support_language_for_screenshot.dart';

Future<void> main() async {
   // Create the config instance
   final emu = await Emulators.build();

   // Shutdown all the running emulators
   await emu.shutdownAll();

   // For each emulator in the list, we run `flutter drive`.
   await emu.forEach([
      'nexus_9',
      'Samsung_Galaxy_S10',
      'iPhone 8 Plus',
      'iPhone 8',
      'iPad Pro (12.9-inch) (2th generation)',
      'iPhone 13 Pro Max',
   ])((device) async {
      for (final c in flutterLocalizeSupportLanguagesForScreenShot) {
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
```


3. Open the terminal in the project root and enter the following to create a screenshots.
```bash
flutter drive --target=test_driver/app.dart
```

3. 스크린샷을 만들어줍니다.
   다음을 통해서 스크린샷을 만들어줍니다. 스크린샷은 다음 폴더에 언어별로 저장됩니다.

3. 스크린샷 별로 타이틀을 적어줍니다.
   스토어에 올라갈 이미지를 만들때 상단에 뜨는 스크린샷의 타이틀입니다.

4. 스크린샷에서 갤럭시 이미지 이름을 고쳐줍니다(인식을 위치 필요)
5. 스크린샷 타이틀 설정 파일을 준비해줍니다.
    1. 해당 설정 파일은 다음 위치에 준비됩니다.
6. 스토어 이미지를 만들어줍니다. (다음을 통해서) (맥 환경에서만 가능합니다.)
    7. dart auto_translation/frameit-chrome/bin/frameit_chrome.dart
7. 만들어진 스토어 이미지 파일들을, fastlane 이 인식할수있는 곳에 복사해줍니다.
7. 스토어에 만들어진 이미지 배포하기
    8. 안드로이드
    9. ios 