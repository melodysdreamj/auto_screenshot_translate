import 'package:csv/csv.dart';

class MyCsv {
  MyCsv(this.data);

  final List<List<dynamic>> data;

  addRow(List<dynamic> _row){
    data.add(_row);
  }

  List<dynamic> getFirstRow(){
    return data[0];
  }

  setFirstRow(List<dynamic> firstRow){
    data[0] = firstRow;
  }

  String convertCsvString(){
    return const ListToCsvConverter().convert(data);
  }
}
