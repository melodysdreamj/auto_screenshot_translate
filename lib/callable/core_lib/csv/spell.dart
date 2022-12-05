import 'dart:io';

import 'package:csv/csv.dart';

import 'entity/my_csv.dart';

class CsvSpell {
  Future<MyCsv> readFromPath(String csvFilePath) async {
    return MyCsv(const CsvToListConverter()
        .convert(await File(csvFilePath).readAsString()));
  }
}

main() async {
  String _ = await File('assets/langs.csv').readAsString();
  print(_);

  dynamic __ = const CsvToListConverter()
      .convert(await File('assets/langs.csv').readAsString());
  print(__);

  MyCsv ___ = MyCsv(const CsvToListConverter()
      .convert(await File('assets/langs.csv').readAsString()));
  print(___);
  print(___.getFirstRow());


  List<List<dynamic>> rowsAsListOfCSV = const CsvToListConverter()
      .convert(await File('assets/sample.csv').readAsString());
  print(rowsAsListOfCSV);
}