import 'dart:io';

import '../../core_lib/csv/entity/my_csv.dart';
import 'spell.dart';

main() async {
  MyCsv myCsvMaker = await MyTranslateCsvSpell()(
      csvFilePath: './assets/localization.csv',
      startLanguageCode: "en",
      skipLanguageCodes: ['ko'],
      skipStr: [],
  apiKey: 'INPUT_YOUR_GOOGLE_TRANSLATE_API_KEY');

  await File('./assets/localization.csv').writeAsString(myCsvMaker.convertCsvString());
}
