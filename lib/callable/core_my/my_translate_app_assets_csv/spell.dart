import 'dart:io';

import '../../core_lib/csv/entity/my_csv.dart';
import '../my_translate_csv/spell.dart';

class MyTranslateAppAssetsCsvSpell {
  Future call(
      {String? startLanguageCode,
      List<String>? skipLanguageCodes,
      List<String>? skipStr,
      String? appAssetsCsvPath,
      required String apiKey,
      }) async {
    /// csv 를 번역하기
    MyCsv translatedCsv = await MyTranslateCsvSpell()(
        csvFilePath: appAssetsCsvPath ?? 'assets/langs.csv',
        startLanguageCode: startLanguageCode ?? 'ko',
        skipLanguageCodes: skipLanguageCodes ?? const [],
        skipStr: skipStr ?? const [],
        apiKey: apiKey,
        );
    await File(appAssetsCsvPath ?? 'assets/langs.csv')
        .writeAsString(translatedCsv.convertCsvString());
    // /// 구글언어코드를 플러터 언어코드로 변경후 반환하기
    // return _firstRowConvertFromGoogleCodeToFlutterCode(translatedCsv);
  }

// MyCsv _firstRowConvertFromGoogleCodeToFlutterCode(MyCsv translatedCsv) {
//   List<dynamic> firstRow = translatedCsv.getFirstRow();
//   List<dynamic> flutterCsvFirstRow = [];
//   for (var googleLanguageCode in firstRow) {
//     flutterCsvFirstRow.add(MyLanguageCodeSpell.to
//         .convert_GoogleApiLanguageCode_To_FlutterLanguageCode(
//             googleLanguageCode));
//   }
//   return translatedCsv;
// }
}
