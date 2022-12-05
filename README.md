# Auto App Translate

[![Pub](https://img.shields.io/pub/v/auto_screenshot_translate.svg)](https://pub.dev/packages/auto_screenshot_translate)

It is a library that translates apps into 80 languages and automates settings.

![](https://user-images.githubusercontent.com/21379657/205770462-7a9ed41a-68db-450a-bbd6-012a3c752f1d.jpg)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/melodysdren)


# How to Use?
## 0. preapre
The following libraries must be set up to apply this library
- [auto_app_translate](https://pub.dev/packages/auto_app_translate)
- [auto_store_translate](https://pub.dev/packages/auto_store_translate)

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
### 1. download [text_drive.zip](https://github.com/melodysdreamj/auto_screenshot_translate/files/10154605/test_driver.zip) file, and put it in the project root directory.
   - [text_drive.zip](https://github.com/melodysdreamj/auto_screenshot_translate/files/10154605/test_driver.zip)
<br/>
![](https://user-images.githubusercontent.com/21379657/205572412-098ff34d-498c-4d1c-ae2b-ba2f9e37dbe1.png)

- Please set the part you want to screenshot and insert the screenshot code. Please refer to the [official document](https://docs.flutter.dev/get-started/test-drive) for details.


### 2. create "auto_translate" directory in the project root directory.<br/>
![](https://user-images.githubusercontent.com/21379657/205582934-d8500e06-e918-49c8-b661-8801bff40848.png)

### 3. download [frameit-chrome.zip](https://github.com/melodysdreamj/auto_screenshot_translate/blob/main/example/auto_translation/frameit-chrome.zip) folder, and put it in the "auto_translate" directory.
![](https://user-images.githubusercontent.com/21379657/205587548-89dffbcb-224a-4af7-982a-53c42ad3ab72.png)

### 4. create "make_screenshot.dart" file in the "auto_translate" directory and write the following code.
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
      'iPad Pro (12.9-inch) (5th generation)',
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


### 5. Open the terminal in the project root and enter the following to create a screenshots.
```bash
dart auto_translation/make_screenshots.dart 
```

### 6. you can see the screenshots in the "auto_translation/screenshots" directory.<br/><br/>
![](https://user-images.githubusercontent.com/21379657/205600688-fa5eda3f-c354-4d15-9812-9636d47a5c10.png)




### 7. remove underbar in the file name of the galaxy screenshots.<br/><br/>
- create dart file name is "frame_galaxy_remove_under_bar.dart" in the "auto_translate" directory and write the following code.
```dart
import 'package:auto_screenshot_translate/auto_screenshot_translate.dart';

Future<void> main() async {
  AutoScreenshotTranslate.removeUnderBarInGalaxy();
}
```
   - run this file in the terminal.
```bash
dart auto_translation/frame_galaxy_remove_under_bar.dart 
```


### 8. prepare screenshot title for generate store images.
- create dart file name is "frame_prepare.dart" in the "auto_translate" directory and write the following code.
```dart
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
    screenshotSubTitle01: "",
    screenshotSubTitle02: "",
    screenshotSubTitle03: "",
    screenshotSubTitle04: "",
    screenshotSubTitle05: "",

    // screenshot start language for translate
    screenshotStartLanguageCode: "en",
  );

  AutoScreenshotTranslate.prepareGenerateScreenshotFrame(myScreenshotInfo);
}
```
- Fill in the screenshotSubTitle0~ with the instructions you want to use and run the code below at the project root terminal.
```bash
dart auto_translation/frame_prepare.dart
```
- after translate, you can see "keyword.strings" file in the auto_translation/screenshots directory.<br/>
![](https://user-images.githubusercontent.com/21379657/205615306-3c8ad43b-7796-42ea-a235-9dc19572a19c.png)

### 9. Enter the following command in the project root terminal to generate store images.
```bash
dart auto_translation/frameit-chrome/bin/frameit_chrome.dart 
```

### 10. You can see that the store image is generated in the "auto_translation/framed" directory as follows.
![](https://user-images.githubusercontent.com/21379657/205624555-01cd3a66-3963-4550-855e-626405d2ba96.png)


### 11. Move the generated file to the file structure that fastlane can understand.
- create dart file name is "framed_distribute.dart" in the "auto_translate" directory and write the following code.
```dart
import 'package:auto_screenshot_translate/auto_screenshot_translate.dart';

Future<void> main() async {
  AutoScreenshotTranslate.distributeScreenshotFrameFile();
}
```
- run this file in the terminal.
```bash
dart auto_translation/framed_distribute.dart 
```
- You can see the files that are made of structures that fastlane can understand.
![](https://user-images.githubusercontent.com/21379657/205647298-0b5e30ed-3845-4af7-be94-8614d4f8dcbe.png)




### 12. deploy to play store and app store.
### - play store

#### 1. Setup the fastlane config file(android)
please refer to the [official document](https://docs.fastlane.tools/getting-started/android/setup/) and [auto_store_translate](https://pub.dev/packages/auto_store_translate) library.

#### 2. Add the code below under platform:android do in the android/fastlane/fastfile file.
```ruby
    lane :metaWithScreenshot do
      upload_to_play_store(
          track: 'internal',
          metadata_path: '../auto_translation/metadata/android',
          skip_upload_changelogs: true,
          release_status: 'draft',
          aab: '../build/app/outputs/bundle/release/app-release.aab',
      )
    end
```

#### 3. Open the terminal in the android project location and enter the following.
```bash
fastlane metaWithScreenshot
```

#### 4. You will see the translated information in the play store console.
![](https://user-images.githubusercontent.com/21379657/205650546-c418fffc-2206-406e-a3cc-71068e1dc8a0.jpg)


### - app store
#### 1. Setup the fastlane config file(ios)
please refer to the [official document](https://docs.fastlane.tools/getting-started/ios/setup/).

#### 2. Add the code below under platform:ios do in the ios/fastlane/fastfile file.
```ruby
   lane :onlyScreenShotOverWrite do
      get_certificates           # invokes cert
      get_provisioning_profile   # invokes sigh
      deliver(
          skip_metadata: true,
          screenshots_path: '../metadata/[프로젝트명]/ios/screenshots',
          overwrite_screenshots: true,
          force: true, # Skip HTMl report verification
          # skip_screenshots: true,
          skip_binary_upload: true,
      )
   end
```

#### 3. Open the terminal in the ios project location and enter the following.
```bash
fastlane onlyScreenShotOverWrite
```

#### 4. You will see the translated information in the app store connect.
![](https://user-images.githubusercontent.com/21379657/205650919-d8be61a9-5eea-4c67-8628-66846a6e7ebb.jpg)


