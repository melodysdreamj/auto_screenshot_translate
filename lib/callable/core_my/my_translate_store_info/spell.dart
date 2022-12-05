import 'dart:io';

import '../../core_lib/google_translate/spell.dart';
import '../my_language_code/entity/google_translate_support_language_code.dart';
import '../my_language_code/spell.dart';
import 'entity/my_store_info.dart';
import 'package:basic_utils/basic_utils.dart';

class MyTranslateStoreInfoSpell {
  static const PATH = "auto_translation/metadata";

  translateStoreInfo(
      MyStoreInfo myStoreInfo, String googleTranslateApiKey) async {
    await _runPlayStoreTitle(
        myStoreInfo.playStoreTitle,
        myStoreInfo.playStoreStartLanguage,
        myStoreInfo.translatePlayStoreName,
        myStoreInfo.onlyFirstCharacterUpperAppName,
        29,
        googleTranslateApiKey);
    await _runPlayStoreShortDescription(myStoreInfo.playStoreShortDescription,
        myStoreInfo.playStoreStartLanguage, 79, googleTranslateApiKey);
    await _runPlayStoreFullDescription(myStoreInfo.playStoreFullDescription,
        myStoreInfo.playStoreStartLanguage, 3999, googleTranslateApiKey);

    await _runAppStoreTitle(
        myStoreInfo.appStoreTitle,
        myStoreInfo.appStoreStartLanguage,
        myStoreInfo.translateAppStoreName,
        myStoreInfo.onlyFirstCharacterUpperAppName,
        29,
        googleTranslateApiKey);
    await _runAppStoreSubTitle(myStoreInfo.appStoreSubTitle,
        myStoreInfo.appStoreStartLanguage, 29, googleTranslateApiKey);
    await _runAppStoreDescription(myStoreInfo.appStringDescription,
        myStoreInfo.appStoreStartLanguage, 3999, googleTranslateApiKey);
    await _runAppStoreKeywords(myStoreInfo.appStoreKeywords,
        myStoreInfo.appStoreStartLanguage, 99, googleTranslateApiKey);
    await _runAppStoreSupportUrl(
      myStoreInfo.homepageLink,
      myStoreInfo.appStoreStartLanguage,
    );
    await _runAppStoreMarketingUrl(
      myStoreInfo.homepageLink,
      myStoreInfo.appStoreStartLanguage,
    );
    await _runAppStorePrivacyUrl(
      myStoreInfo.policyPageLink,
      myStoreInfo.appStoreStartLanguage,
    );
    await _runAppStoreReleaseNote(
      myStoreInfo.releaseNote,
      myStoreInfo.appStoreStartLanguage,
    );
  }

  translateStoreInfoOnlyAppName(
      MyStoreInfo myStoreInfo, String googleTranslateApiKey) async {
    await _runPlayStoreTitle(
        myStoreInfo.playStoreTitle,
        myStoreInfo.playStoreStartLanguage,
        myStoreInfo.translatePlayStoreName,
        myStoreInfo.onlyFirstCharacterUpperAppName,
        29,
        googleTranslateApiKey);
    await _runAppStoreTitle(
        myStoreInfo.appStoreTitle,
        myStoreInfo.appStoreStartLanguage,
        myStoreInfo.translateAppStoreName,
        myStoreInfo.onlyFirstCharacterUpperAppName,
        29,
        googleTranslateApiKey);
  }

  translateStoreInfoOnlyTitle() {}

  _runPlayStoreTitle(
    String text,
    String fromLang,
    bool doTranslate,
    bool onlyFirstCharacterUpperAppName,
    int textLimitLength,
    String googleTranslateApiKey,
  ) async {
    //1. 언어별로 번역해주자.
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText;
      if (targetLang == fromLang) {
        resultText = text;
        print('$fromLang $resultText ${resultText.length}');
      } else {
        if (doTranslate) {
          resultText = await GoogleTranslateSpell()
              .translate(fromLang, targetLang, text, googleTranslateApiKey);
        } else {
          resultText = text;
        }
      }

      //2. 우선 대문자화를 해주자.(타이틀만 해당)
      if (onlyFirstCharacterUpperAppName) {
        resultText = StringUtils.capitalize(resultText, allWords: true);
      }

      //2. 글자수 체크하고 많을 경우 잘라주자
      if (onlyFirstCharacterUpperAppName) {
        resultText = _checkStringLengthAndCut(resultText, textLimitLength);
      }

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeAndroidInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'title.txt');
    }
  }

  _runPlayStoreShortDescription(String text, String fromLang,
      int textLimitLength, String googleTranslateApiKey) async {
    //1. 언어별로 번역해주자.
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText;
      if (targetLang == fromLang) {
        resultText = text;
        print('$fromLang $resultText ${resultText.length}');
      } else {
        resultText = await GoogleTranslateSpell()
            .translate(fromLang, targetLang, text, googleTranslateApiKey);
      }

      //2. 글자수 체크하고 많을 경우 잘라주자
      resultText = _checkStringLengthAndCut(resultText, textLimitLength);

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeAndroidInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'short_description.txt');
    }
  }

  _runPlayStoreFullDescription(String text, String fromLang,
      int textLimitLength, String googleTranslateApiKey) async {
    //1. 언어별로 번역해주자.
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText;
      if (targetLang == fromLang) {
        resultText = text;
        print('$fromLang $resultText ${resultText.length}');
      } else {
        resultText = await GoogleTranslateSpell()
            .translate(fromLang, targetLang, text, googleTranslateApiKey);
      }

      //2. 글자수 체크하고 많을 경우 잘라주자
      resultText = _checkStringLengthAndCut(resultText, textLimitLength);

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeAndroidInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'full_description.txt');
    }
  }

  _runAppStoreTitle(
    String text,
    String fromLang,
    bool doTranslate,
    bool onlyFirstCharacterUpperAppName,
    int textLimitLength,
    String googleTranslateApiKey,
  ) async {
    //1. 언어별로 번역해주자.
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText;
      if (targetLang == fromLang) {
        resultText = text;
      } else {
        if (doTranslate) {
          resultText = await GoogleTranslateSpell()
              .translate(fromLang, targetLang, text, googleTranslateApiKey);
        } else {
          resultText = text;
        }
      }
      print('$fromLang $resultText ${resultText.length}');

      //2. 우선 대문자화를 해주자.(타이틀만 해당)
      if (onlyFirstCharacterUpperAppName) {
        resultText = StringUtils.capitalize(resultText, allWords: true);
      }

      //2. 글자수 체크하고 많을 경우 잘라주자
      resultText = _checkStringLengthAndCut(resultText, textLimitLength);

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang, resultText: resultText, fileName: 'name.txt');
    }
  }

  _runAppStoreSubTitle(String text, String fromLang, int textLimitLength,
      String googleTranslateApiKey) async {
    //1. 언어별로 번역해주자.
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText;
      if (targetLang == fromLang) {
        resultText = text;
        print('$fromLang $resultText ${resultText.length}');
      } else {
        resultText = await GoogleTranslateSpell()
            .translate(fromLang, targetLang, text, googleTranslateApiKey);
      }

      //2. 글자수 체크하고 많을 경우 잘라주자
      resultText = _checkStringLengthAndCut(resultText, textLimitLength);

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'subtitle.txt');
    }
  }

  _runAppStoreDescription(String text, String fromLang, int textLimitLength,
      String googleTranslateApiKey) async {
    //1. 언어별로 번역해주자.
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText;
      if (targetLang == fromLang) {
        resultText = text;
        print('$fromLang $resultText ${resultText.length}');
      } else {
        resultText = await GoogleTranslateSpell()
            .translate(fromLang, targetLang, text, googleTranslateApiKey);
      }

      //2. 글자수 체크하고 많을 경우 잘라주자
      resultText = _checkStringLengthAndCut(resultText, textLimitLength);

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'description.txt');
    }
  }

  _runAppStoreKeywords(String text, String fromLang, int textLimitLength,
      String googleTranslateApiKey) async {
    //1. 언어별로 번역해주자.
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText;
      if (targetLang == fromLang) {
        resultText = text;
        print('$fromLang $resultText ${resultText.length}');
      } else {
        resultText = await GoogleTranslateSpell()
            .translate(fromLang, targetLang, text, googleTranslateApiKey);
      }

      //2. 글자수 체크하고 많을 경우 잘라주자
      resultText = _checkStringLengthAndCut(resultText, textLimitLength);

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'keywords.txt');
    }
  }

  _runAppStoreSupportUrl(String text, String fromLang) async {
    //1. 언어별
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText = text;

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'support_url.txt');
    }
  }

  _runAppStoreMarketingUrl(String text, String fromLang) async {
    //1. 언어별
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText = text;

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'marketing_url.txt');
    }
  }

  _runAppStorePrivacyUrl(String text, String fromLang) async {
    //1. 언어별
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText = text;

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'privacy_url.txt');
    }
  }

  _runAppStoreReleaseNote(String text, String fromLang) async {
    //1. 언어별
    for (var targetLang in googleTranslateSupportLanguages) {
      late String resultText = text;

      //3. 번역한 내용과 언어코드를 전달하면 적절히 처리해주자.
      await distributeIosInfo(
          targetLang: targetLang,
          resultText: resultText,
          fileName: 'release_notes.txt');
    }
  }

  String _checkStringLengthAndCut(String text, int limitLength) {
    //2. 글자수 체크하고 많을 경우 잘라주자
    int count = text.length;
    if (count > limitLength) {
      text = text.substring(0, limitLength);
    }
    return text;
  }

  distributeAndroidInfo(
      {required String targetLang,
      required String resultText,
      required String fileName}) async {
    List<String> langs = MyLanguageCodeSpell.to
        .convertGoogleApiLanguageCodeToPlayStoreLanguageCode(targetLang);
    for (var langFolderName in langs) {
      File file = await File('$PATH/android/$langFolderName/$fileName')
          .create(recursive: true);
      file.writeAsString(resultText);
    }
  }

  distributeIosInfo(
      {required String targetLang,
      required String resultText,
      required String fileName}) async {
    List<String> langs = MyLanguageCodeSpell.to
        .convertGoogleApiLanguageCodeToAppStoreLanguageCode(targetLang);
    for (var langFolderName in langs) {
      File file = await File('$PATH/ios/$langFolderName/$fileName')
          .create(recursive: true);
      file.writeAsString(resultText);
    }
  }
}
