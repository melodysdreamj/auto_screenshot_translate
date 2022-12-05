import 'dart:io';

import 'package:quiver/iterables.dart';

import '../../core_lib/csv/entity/my_csv.dart';
import '../../core_lib/csv/spell.dart';
import '../my_language_code/entity/flutter_support_language_code.dart';
import '../my_language_code/entity/google_translate_support_language_code.dart';
import '../../core_lib/google_translate/spell.dart';

class MyTranslateCsvSpell {
  Future<MyCsv> call({
    required String csvFilePath,
    required String startLanguageCode,
    required List<String> skipLanguageCodes,
    required List<String> skipStr,
    required String apiKey,
  }) async {
    MyCsv originLocalizationCsvObj =
        await CsvSpell().readFromPath(csvFilePath);

    List<dynamic> languages = originLocalizationCsvObj.getFirstRow();

    //str 리스트
    List<dynamic> strColumn =
        await _targetColumnList(originLocalizationCsvObj, languages, 'str');

    //타겟 언어 리스트
    List<dynamic> startLangColumn = await _targetColumnList(
        originLocalizationCsvObj, languages, startLanguageCode);

    //번역하지않고 보관하는 리스트들
    List<List<dynamic>> saveLangColumns = await _saveLangColumnsFromCode(
        originLocalizationCsvObj, languages, skipLanguageCodes);

    MyCsv newVersionTranslateCsv = MyCsv([]);

    //맨 첫줄 만들어준후에
    newVersionTranslateCsv
        .addRow(await _getFirstRow(startLanguageCode, skipLanguageCodes));

    //row
    for (num i in range(startLangColumn.length)) {
      int index = i.toInt();

      if (index == 0) continue;

      //row 에 요소 컬럼별로 하나씩 채우기
      var nextRow = [];

      //만약에 skipStr 라면, 기존에꺼를 통채로 가져와서 해줘도 될것으로 보인다.
      if (skipStr.contains(strColumn[index])) {
        print("이런경우 있는지 체크하기:${strColumn[index]}");

        List<String>? skipRow =
            _getSkipRowByName(strColumn[index], originLocalizationCsvObj);

        if (skipRow != null) {
          newVersionTranslateCsv.addRow(skipRow);
          continue;
        }
      }

      for (String columnName in newVersionTranslateCsv.getFirstRow()) {
        // print('columnName:$columnName');
        if (columnName == 'str') {
          nextRow.add(strColumn[index]);
          continue;
        }
        if (columnName == startLanguageCode) {
          nextRow.add(startLangColumn[index]);
          continue;
        }

        if (strColumn[index] == 'projectIdForProtect') {
          nextRow.add('');
          continue;
        }

        bool isSaveLang = false; //for loop 바깥쪽도 멈추기 위해서
        for (List<dynamic> saveLangColumn in saveLangColumns) {
          if (columnName == saveLangColumn[0]) {
            try {
              nextRow.add(saveLangColumn[index]);
            } catch (e) {
              nextRow.add(startLangColumn[index]);
            }
            isSaveLang = true;
            break;
          }
        }
        if (isSaveLang) continue;

        nextRow.add(await GoogleTranslateSpell()
            .translate(startLanguageCode, columnName, startLangColumn[index],apiKey));
        // nextRow.add(await translateString(
        //     fromLanguageCode: startLanguageCode,
        //     toLanguage: columnName,
        //     input: startLangColumn[index]));

        //그 외에는 모두 번역대상이라고 생각하면 된다.

        /*
      startLanguageCode <- 번역시작 언어
      startLangColumn[index] <- 번역할 문자열
      columnName <- 번역언어
       */

      }

      newVersionTranslateCsv.addRow(nextRow);
    }
    String result = newVersionTranslateCsv.convertCsvString();
    print("result:$result");

    /*]
    1. 이거 캡슐화해주고
    2. 하나 만들어서 str 쪽 먼저 깔아준다음에
    3. 타겟언어 깔아주고
    4. 건들지 말라고 하는 언어 깔아준다음
    5. 전체 시작해주는데, 이떄 건들지 말라는 로우 있으면 그거는 그냥 공백 채우면서 전체 번역 ㄱㄱ
  
  
     */

    return newVersionTranslateCsv;
    // await File(csvFilePath).writeAsString(myCsvMaker.convertCsvString());
    
    
  }

  Future<List> _getFirstRow(
      String startLanguageCode, List<String> skipLanguageCodes) async {
    var firstRow = ['str', startLanguageCode];
    for (var saveLanguage in skipLanguageCodes) {
      if (saveLanguage == 'str' || saveLanguage == startLanguageCode) continue;
      firstRow.add(saveLanguage);
    }
    for (var supportLanguage in flutterLocalizeSupportLanguages) {
      if (supportLanguage == 'str' ||
          supportLanguage == startLanguageCode ||
          skipLanguageCodes.contains(supportLanguage)) continue;
      firstRow.add(supportLanguage);
    }
    return firstRow;
  }

  Future<List> _targetColumnList(
    MyCsv originLocalizationCsvObj,
    List<dynamic> languages,
    String targetLanguageCode,
  ) async {
    print('languages:$languages');
    print('targetLanguageCode:$targetLanguageCode');

    late int fromIndex;
    languages.asMap().forEach((index, language) {
      // print('index:$index language:$language');

      if (targetLanguageCode == language) {
        fromIndex = index;
      }
    });

    //타겟 컬럼 내용 리스트
    List<dynamic> startLangColumn = [];

    for (var elements in originLocalizationCsvObj.data) {
      // if (elements[fromIndex] == startLanguageCode) {
      //   continue;
      // }
      startLangColumn.add(elements[fromIndex]);
    }

    return startLangColumn;
  }

  Future<List<List>> _saveLangColumnsFromCode(MyCsv originLocalizationCsvObj,
      List<dynamic> languages, List<String> skipLanguageCodes) async {
    List<List<dynamic>> saveLangColumns = [];
    for (var saveLanguage in skipLanguageCodes) {
      saveLangColumns.add(await _targetColumnList(
          originLocalizationCsvObj, languages, saveLanguage));
    }
    return saveLangColumns;
  }

  List<String>? _getSkipRowByName(
      String skipStr, MyCsv originLocalizationCsvObj) {
    List<String> resultList = [];

    for (var element in originLocalizationCsvObj.data) {
      String str = element[0];
      print('str:$str');
      // print(element.toList().toString());
      //
      // print(element);

      if (skipStr == str) {
        resultList = element.map((e) => e.toString()).toList();
        return resultList;
      }
    }
    return null;
  }
}
