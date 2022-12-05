import 'spell.dart';

main() async {
  String result = await GoogleTranslateSpell()
      .translate('en', 'ko', 'hello', 'INPUT_YOUR_GOOGLE_TRANSLATE_API_KEY');
  print(result);
}
