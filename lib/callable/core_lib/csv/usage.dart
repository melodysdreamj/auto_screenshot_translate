import 'entity/my_csv.dart';
import 'spell.dart';

main() async {
  MyCsv csvObj = await CsvSpell().readFromPath("csv 경로 적어주세요");
}
