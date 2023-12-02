import 'dart:io';

import 'package:path/path.dart';

import '../../core_lib/google_translate/spell.dart';
import '../my_language_code/entity/google_translate_support_language_code.dart';
import '../my_language_code/spell.dart';
import '../my_translate_store_info/entity/my_store_info.dart';
import 'entity/my_screenshot_info.dart';

class MyScreenshotHelperSpell {
  static const PATH = "auto_translation/screenshots";
  static const META_PATH = "auto_translation/metadata";
  static const FRAMED_PATH = "auto_translation/framed";

  removeUnderBarInGalaxy() async {
    List<Directory> langsFolder = await _getLangsFoldersInFolder(PATH);

    for (var element in langsFolder) {
      String folderName = basename(element.path);
      print(folderName);

      Iterable<File> allFiles = await _getFilesInFolder('$PATH/$folderName');

      await _changeGalaxy(allFiles);
    }
  }

  prepareGenerateScreenshotFrame(MyScreenshotInfo myScreenshotInfo,
      List<String>? translateSupportLanguages) async {
    //keyword.strings (안쓰는것)
    _makeStringFile(
        myScreenshotInfo.screenshotTitle01,
        myScreenshotInfo.screenshotTitle02,
        myScreenshotInfo.screenshotTitle03,
        myScreenshotInfo.screenshotTitle04,
        myScreenshotInfo.screenshotTitle05,
        fromLang: myScreenshotInfo.screenshotStartLanguageCode,
        fileName: 'keyword.strings',
        myScreenshotInfo.googleTranslateApiKey,
        translateSupportLanguages: translateSupportLanguages);

    //title.strings (현재사용중)
    _makeStringFile(
        myScreenshotInfo.screenshotSubTitle01,
        myScreenshotInfo.screenshotSubTitle02,
        myScreenshotInfo.screenshotSubTitle03,
        myScreenshotInfo.screenshotSubTitle04,
        myScreenshotInfo.screenshotSubTitle05,
        fromLang: myScreenshotInfo.screenshotStartLanguageCode,
        fileName: 'title.strings',
        myScreenshotInfo.googleTranslateApiKey,
        translateSupportLanguages: translateSupportLanguages);
  }

  distributeScreenshotFrameFile() async {
    List<Directory> langsFolder = await _getLangsFoldersInFolder(FRAMED_PATH);
    print('langsFolder:$langsFolder');

    for (var element in langsFolder) {
      print(element);
      String folderName = basename(element.path);

      Iterable<File> allFiles =
          await _getFilesInFolder('$FRAMED_PATH/$folderName');

      List<File> framedFiles = await _getFramedFileInFileList(allFiles);

      for (var element in framedFiles) {
        await _makeIpad3(element);

        await _copyIos(element, folderName);
        await _copyTablet(element, folderName);
        await _copyGalaxy(element, folderName);
      }
    }
  }

  _makeIpad3(File element) async {
    if (basename(element.path)
            .contains('iPad Pro (12.9-inch) (5th generation)') &&
        !basename(element.path).contains('ipadPro129')) {
      //카피해서 3세대꺼로 하나더 만들어주자.
      File newFile = await File(
              '${element.parent.path}/ipadPro129${basename(element.path)}')
          .create(recursive: true);
      newFile.writeAsBytesSync(element.readAsBytesSync());
    }
  }

  _copyIos(File element, String langFolderName) async {
    if (basename(element.path).contains('iPad Pro')) {
      //애플의 경우 ios 폴더 쪽으로 넘겨줍니다.
      List<String> langs = MyLanguageCodeSpell.to
          .convertFlutterLanguageCodeToAppStoreLanguageCode(langFolderName);
      for (var langFolderName in langs) {
        print('basename(element.path):${basename(element.path)}');
        if (basename(element.path).contains('ipadPro129')) {
          //5세대 이상일 경우 바로 복사
          File newFile = await File(
                  '../ios/screenshots/$langFolderName/${basename(element.path)}')
              .create(recursive: true);
          newFile.writeAsBytesSync(element.readAsBytesSync());
        } else {
          //아닐경우 2세대로 고쳐줌
          String fileName = basename(element.path);
          File newFile = await File(
                  '$META_PATH/ios/$langFolderName/iPad Pro (12.9-inch) (2rd generation)${fileName.substring(fileName.length - 7)}')
              .create(recursive: true);
          newFile.writeAsBytesSync(element.readAsBytesSync());
        }
      }
    }
    if (basename(element.path).contains('iPhone')) {
      //애플의 경우 ios 폴더 쪽으로 넘겨줍니다.
      List<String> langs = MyLanguageCodeSpell.to
          .convertFlutterLanguageCodeToAppStoreLanguageCode(langFolderName);
      for (var langFolderName in langs) {
        File newFile = await File(
                '$META_PATH/ios/$langFolderName/${basename(element.path)}')
            .create(recursive: true);
        newFile.writeAsBytesSync(element.readAsBytesSync());
      }
    }
  }

  _copyTablet(File element, String langFolderName) async {
    //태블릿의 경우 진행해줍니다.
    if (basename(element.path).contains('nexus_9')) {
      List<String> langs = MyLanguageCodeSpell.to
          .convertFlutterLanguageCodeToPlayStoreLanguageCode(langFolderName);
      for (var langFolderName in langs) {
        File new7File = await File(
                '$META_PATH/android/$langFolderName/images/sevenInchScreenshots/${basename(element.path)}')
            .create(recursive: true);
        new7File.writeAsBytesSync(element.readAsBytesSync());
      }

      for (var langFolderName in langs) {
        File new10File = await File(
                '$META_PATH/android/$langFolderName/images/tenInchScreenshots/${basename(element.path)}')
            .create(recursive: true);
        new10File.writeAsBytesSync(element.readAsBytesSync());
      }
    }
  }

  _copyGalaxy(File element, String langFolderName) async {
    //갤럭리의 경우 진행해줍니다.
    if (basename(element.path).contains('Galaxy')) {
      List<String> langs = MyLanguageCodeSpell.to
          .convertFlutterLanguageCodeToPlayStoreLanguageCode(langFolderName);
      for (var langFolderName in langs) {
        File newFile = await File(
                '$META_PATH/android/$langFolderName/images/phoneScreenshots/${basename(element.path)}')
            .create(recursive: true);
        newFile.writeAsBytesSync(element.readAsBytesSync());
      }
    }
  }

  _makeStringFile(
      String screenString1,
      String screenString2,
      String screenString3,
      String screenString4,
      String screenString5,
      String googleTranslateApiKey,
      {required String fromLang,
      required String fileName,
      List<String>? translateSupportLanguages}) async {
    //1. 언어별로 번역해주자.
    for (var targetLang
        in translateSupportLanguages ?? googleTranslateSupportLanguages) {
      late String resultScreenString1 = "";
      late String resultScreenString2 = "";
      late String resultScreenString3 = "";
      late String resultScreenString4 = "";
      late String resultScreenString5 = "";
      if (targetLang == fromLang ||
          (screenString1 == "" &&
              screenString2 == "" &&
              screenString3 == "" &&
              screenString4 == "" &&
              screenString5 == "")) {
        resultScreenString1 = screenString1;
        resultScreenString2 = screenString2;
        resultScreenString3 = screenString3;
        resultScreenString4 = screenString4;
        resultScreenString5 = screenString5;
      } else {
        resultScreenString1 = await GoogleTranslateSpell().translate(
            fromLang, targetLang, screenString1, googleTranslateApiKey);
        resultScreenString2 = await GoogleTranslateSpell().translate(
            fromLang, targetLang, screenString2, googleTranslateApiKey);
        resultScreenString3 = await GoogleTranslateSpell().translate(
            fromLang, targetLang, screenString3, googleTranslateApiKey);
        resultScreenString4 = await GoogleTranslateSpell().translate(
            fromLang, targetLang, screenString4, googleTranslateApiKey);
        resultScreenString5 = await GoogleTranslateSpell().translate(
            fromLang, targetLang, screenString5, googleTranslateApiKey);
      }

      //각 폴더에 맞게 배분해주자.
      String langs = await MyLanguageCodeSpell.to
          .convertGoogleApiLanguageCodeToFlutterLanguageCode(targetLang);

      File file = await File('$PATH/$langs/$fileName').create(recursive: true);
      file.writeAsString(_makeTemplate(resultScreenString1, resultScreenString2,
          resultScreenString3, resultScreenString4, resultScreenString5));
    }
  }

  String _makeTemplate(String screenString1, String screenString2,
      String screenString3, String screenString4, String screenString5) {
    return '''

"_01" = "$screenString1";

"_02" = "$screenString2";

"_03" = "$screenString3";

"_04" = "$screenString4";

"_05" = "$screenString5";

  ''';
  }

  Future<List<File>> _getFramedFileInFileList(Iterable<File> files) async {
    List<File> framedFiles = [];

    for (var element in files) {
      print(basename(element.path));
      if ((basename(element.path).contains('_01')) ||
          (basename(element.path).contains('_02')) ||
          (basename(element.path).contains('_03')) ||
          (basename(element.path).contains('_04')) ||
          (basename(element.path).contains('_05'))) {
        framedFiles.add(element);
      }
    }
    return framedFiles;
  }

  Future<List<Directory>> _getLangsFoldersInFolder(String folderPath) async {
    List<Directory> directories = await _getFoldersInFolder(folderPath);
    List<Directory> langs = [];

    for (var element in directories) {
      if (basename(element.path) != "_fonts" &&
          basename(element.path) != "_tools") {
        langs.add(element);
      }
    }
    return langs;
  }

  Future<List<Directory>> _getFoldersInFolder(String folderPath) async {
    List<Directory> directories = [];
    final dir = Directory(folderPath);
    List contents = dir.listSync();
    for (var fileOrDir in contents) {
      if (fileOrDir is Directory) {
        // print(fileOrDir.path);
        directories.add(fileOrDir);
      }
    }
    return directories;
  }

  Future<Iterable<File>> _getFilesInFolder(String folderPath) async {
    final dir = Directory(folderPath);
    final List<FileSystemEntity> entities = await dir.list().toList();
    return entities.whereType<File>();
  }

  _changeGalaxy(Iterable<File> allFiles) {
    for (var element in allFiles) {
      // print("여긴왔냐?:${basename(element.path)}");
      if (basename(element.path).contains('Samsung_Galaxy_S10')) {
        // print("여긴왔냐?");
        _changeFileNameOnly(
            element,
            basename(element.path)
                .replaceAll('Samsung_Galaxy_S10', 'Samsung Galaxy S10'));
      }
    }
  }

  _changeFileNameOnly(File file, String newFileName) async {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }
}
