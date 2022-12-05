# Auto App Translate

It is a library that translates apps into 80 languages and automates settings.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/melodysdren)

# How to Use?
## 1. prepare the android / ios emulator
(it should be made to fit the size of the store. please refer [this link](https://appfollow.io/blog/app-store-and-google-play-screenshot-guidelines))
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
```yaml

```

## 3. Set the scene of the screenshot in the app
- before taking a screenshot, you need to set which screen to take a screenshot.



2. 먼저 test_drive 를 설정해야합니다.(스크린샷 씬 설정하기)

이걸 하는 이유는, 앱을 스크린샷 하기전에 어떤 화면을 스크린샷할지를 설정해줘야합니다.
자세한 내용은 이쪽을 참조해주세요.

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