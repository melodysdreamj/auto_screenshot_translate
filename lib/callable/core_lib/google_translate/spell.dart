import 'package:dio/dio.dart';

import '../../core_my/my_language_code/spell.dart';
import '../free_google_translate/spell.dart';

class GoogleTranslateSpell {
  Future<String> translate(String fromLanguage, String toLanguage, String text,
      String apiKey) async {
    if (text == "") return "";

    fromLanguage = MyLanguageCodeSpell.to
        .convertFlutterLanguageCodeToGoogleApiLanguageCode(fromLanguage);
    toLanguage = MyLanguageCodeSpell.to
        .convertFlutterLanguageCodeToGoogleApiLanguageCode(toLanguage);

    if(apiKey == "INPUT_YOUR_GOOGLE_TRANSLATE_API_KEY" || apiKey == ""){
      return await FreeGoogleTranslationSpell().translate(text, to: toLanguage);
    }

    final Dio _dio = Dio(BaseOptions(
        baseUrl: "https://translation.googleapis.com/language/translate/v2"));

    try {
      Response response = await _dio.post(
        "?key=$apiKey",
        data: {
          "q": text,
          "source": fromLanguage,
          "target": toLanguage,
          "format": "text"
        },
      );

      if (response.statusCode == 200 &&
          response.data?["data"]?["translations"] != null &&
          response.data["data"]?["translations"]?.length > 0) {
        text = response.data["data"]?["translations"].first["translatedText"];
      }
    } catch (e) {
      print(e);
    }

    print(text);

    return text;
  }
}

main() async {
  String result = await GoogleTranslateSpell()
      .translate('en', 'ko', 'hello', 'INPUT_YOUR_GOOGLE_TRANSLATE_API_KEY');
  print(result);
}
