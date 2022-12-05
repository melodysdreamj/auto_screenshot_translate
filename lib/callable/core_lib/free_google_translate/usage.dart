import 'spell.dart';

main() async {
  String result = await FreeGoogleTranslationSpell().translate("hello world",to: "ko");
  print(result);
}
