class MyLanguageCodeSpell {
  static MyLanguageCodeSpell get to => MyLanguageCodeSpell();

  /// 구글언어코드 -> 플러터언어코드
  convertGoogleApiLanguageCodeToFlutterLanguageCode(
      String googleLanguageCode) async {
    if (googleLanguageCode == 'tl') {
      return 'fil';
    } else if (googleLanguageCode == 'zh-cn') {
      return 'zh';
    } else if (googleLanguageCode == 'zh-tw') {
      return 'zhb';
    } else if (googleLanguageCode == 'iw') {
      return 'he';
    } else {
      return googleLanguageCode;
    }
  }

  /// 플러터언어코드 -> 구글언어코드
  String convertFlutterLanguageCodeToGoogleApiLanguageCode(
      String flutterLanguageCode) {
    if (flutterLanguageCode == 'fil') {
      return 'tl';
    } else if (flutterLanguageCode == 'zh') {
      return 'zh-cn';
    } else if (flutterLanguageCode == 'zhb') {
      return 'zh-tw';
    } else if (flutterLanguageCode == 'he') {
      return 'iw';
    } else {
      return flutterLanguageCode;
    }
  }

  /// 구글언어코드 -> 플레이스토어 언어코드
  List<String> convertGoogleApiLanguageCodeToPlayStoreLanguageCode(
      String googleLanguageCode) {
    List<String> result = [];

    if (googleLanguageCode == 'az') {
      result.add('az-AZ');
    } else if (googleLanguageCode == 'bn') {
      result.add('bn-BD');
    } else if (googleLanguageCode == 'cs') {
      result.add('cs-CZ');
    } else if (googleLanguageCode == 'da') {
      result.add('da-DK');
    } else if (googleLanguageCode == 'de') {
      result.add('de-DE');
    } else if (googleLanguageCode == 'el') {
      result.add('el-GR');
    } else if (googleLanguageCode == 'en') {
      result.add('en-AU');
      result.add('en-CA');
      result.add('en-GB');
      result.add('en-IN');
      result.add('en-SG');
      result.add('en-US');
      result.add('en-ZA');
    } else if (googleLanguageCode == 'es') {
      result.add('es-419');
      result.add('es-ES');
      result.add('es-US');
    } else if (googleLanguageCode == 'eu') {
      result.add('eu-ES');
    } else if (googleLanguageCode == 'fa') {
      result.add('fa');
      result.add('fa-AE');
      result.add('fa-AF');
      result.add('fa-IR');
    } else if (googleLanguageCode == 'fi') {
      result.add('fi-FI');
    } else if (googleLanguageCode == 'tl') {
      result.add('fil');
    } else if (googleLanguageCode == 'fr') {
      result.add('fr-CA');
      result.add('fr-FR');
    } else if (googleLanguageCode == 'gl') {
      result.add('gl-ES');
    } else if (googleLanguageCode == 'hi') {
      result.add('hi-IN');
    } else if (googleLanguageCode == 'hu') {
      result.add('hu-HU');
    } else if (googleLanguageCode == 'hy') {
      result.add('hy-AM');
    } else if (googleLanguageCode == 'is') {
      result.add('is-IS');
    } else if (googleLanguageCode == 'it') {
      result.add('it-IT');
    } else if ((googleLanguageCode == 'he') || (googleLanguageCode == 'iw')) {
      result.add('iw-IL');
    } else if (googleLanguageCode == 'ja') {
      result.add('ja-JP');
    } else if (googleLanguageCode == 'ka') {
      result.add('ka-GE');
    } else if (googleLanguageCode == 'km') {
      result.add('km-KH');
    } else if (googleLanguageCode == 'kn') {
      result.add('kn-IN');
    } else if (googleLanguageCode == 'ko') {
      result.add('ko-KR');
    } else if (googleLanguageCode == 'ky') {
      result.add('ky-KG');
    } else if (googleLanguageCode == 'lo') {
      result.add('lo-LA');
    } else if (googleLanguageCode == 'mk') {
      result.add('mk-MK');
    } else if (googleLanguageCode == 'ml') {
      result.add('ml-IN');
    } else if (googleLanguageCode == 'mn') {
      result.add('mn-MN');
    } else if (googleLanguageCode == 'mr') {
      result.add('mr-IN');
    } else if (googleLanguageCode == 'ms') {
      result.add('ms');
      result.add('ms-MY');
      result.add('my-MM');
    } else if (googleLanguageCode == 'ne') {
      result.add('ne-NP');
    } else if (googleLanguageCode == 'nl') {
      result.add('nl-NL');
    } else if (googleLanguageCode == 'no') {
      result.add('no-NO');
    } else if (googleLanguageCode == 'pl') {
      result.add('pl-PL');
    } else if (googleLanguageCode == 'pt') {
      result.add('pt-PT');
      result.add('pt-BR');
    } else if (googleLanguageCode == 'ru') {
      result.add('ru-RU');
    } else if (googleLanguageCode == 'si') {
      result.add('si-LK');
    } else if (googleLanguageCode == 'sv') {
      result.add('sv-SE');
    } else if (googleLanguageCode == 'ta') {
      result.add('ta-IN');
    } else if (googleLanguageCode == 'te') {
      result.add('te-IN');
    } else if (googleLanguageCode == 'tr') {
      result.add('tr-TR');
    } else if (googleLanguageCode == 'zh-cn') {
      result.add('zh-CN');
    } else if (googleLanguageCode == 'zh-tw') {
      result.add('zh-HK');
      result.add('zh-TW');
    } else {
      result.add(googleLanguageCode);
    }

    return result;
  }

  /// 구글언어코드 -> 앱스토어 언어 코드
  List<String> convertGoogleApiLanguageCodeToAppStoreLanguageCode(
      String googleLanguageCode) {
    List<String> result = [];

    if (googleLanguageCode == 'ar') {
      result.add('ar-SA');
    } else if (googleLanguageCode == 'ca') {
      result.add('ca');
    } else if (googleLanguageCode == 'cs') {
      result.add('cs');
    } else if (googleLanguageCode == 'da') {
      result.add('da');
    } else if (googleLanguageCode == 'de') {
      result.add('de-DE');
    } else if (googleLanguageCode == 'el') {
      result.add('el');
    } else if (googleLanguageCode == 'en') {
      result.add('en-AU');
      result.add('en-CA');
      result.add('en-GB');
      result.add('en-US');
    } else if (googleLanguageCode == 'es') {
      result.add('es-MX');
      result.add('es-ES');
    } else if (googleLanguageCode == 'fi') {
      result.add('fi');
    } else if (googleLanguageCode == 'fr') {
      result.add('fr-CA');
      result.add('fr-FR');
    } else if (googleLanguageCode == 'hi') {
      result.add('hi');
    } else if (googleLanguageCode == 'hr') {
      result.add('hr');
    } else if (googleLanguageCode == 'hu') {
      result.add('hu');
    } else if (googleLanguageCode == 'id') {
      result.add('id');
    } else if (googleLanguageCode == 'it') {
      result.add('it');
    } else if ((googleLanguageCode == 'he') || (googleLanguageCode == 'iw')) {
      result.add('he');
    } else if (googleLanguageCode == 'ja') {
      result.add('ja');
    } else if (googleLanguageCode == 'ko') {
      result.add('ko');
    } else if (googleLanguageCode == 'ms') {
      result.add('ms');
    } else if (googleLanguageCode == 'nl') {
      result.add('nl-NL');
    } else if (googleLanguageCode == 'no') {
      result.add('no');
    } else if (googleLanguageCode == 'pl') {
      result.add('pl');
    } else if (googleLanguageCode == 'pt') {
      result.add('pt-PT');
      result.add('pt-BR');
    } else if (googleLanguageCode == 'ro') {
      result.add('ro');
    } else if (googleLanguageCode == 'ru') {
      result.add('ru');
    } else if (googleLanguageCode == 'sk') {
      result.add('sk');
    } else if (googleLanguageCode == 'sv') {
      result.add('sv');
    } else if (googleLanguageCode == 'th') {
      result.add('th');
    } else if (googleLanguageCode == 'tr') {
      result.add('tr');
    } else if (googleLanguageCode == 'uk') {
      result.add('uk');
    } else if (googleLanguageCode == 'vi') {
      result.add('vi');
    } else if (googleLanguageCode == 'zh-cn') {
      result.add('zh-Hans');
    } else if (googleLanguageCode == 'zh-tw') {
      result.add('zh-Hant');
    }

    return result;
  }

  /// 플러터언어코드 -> 플레이스토어 언어 코드
  List<String> convertFlutterLanguageCodeToPlayStoreLanguageCode(
      String flutterLanguageCode) {
    List<String> result = [];

    if (flutterLanguageCode == 'az') {
      result.add('az-AZ');
    } else if (flutterLanguageCode == 'bn') {
      result.add('bn-BD');
    } else if (flutterLanguageCode == 'cs') {
      result.add('cs-CZ');
    } else if (flutterLanguageCode == 'da') {
      result.add('da-DK');
    } else if (flutterLanguageCode == 'de') {
      result.add('de-DE');
    } else if (flutterLanguageCode == 'el') {
      result.add('el-GR');
    } else if (flutterLanguageCode == 'en') {
      result.add('en-AU');
      result.add('en-CA');
      result.add('en-GB');
      result.add('en-IN');
      result.add('en-SG');
      result.add('en-US');
      result.add('en-ZA');
    } else if (flutterLanguageCode == 'es') {
      result.add('es-419');
      result.add('es-ES');
      result.add('es-US');
    } else if (flutterLanguageCode == 'eu') {
      result.add('eu-ES');
    } else if (flutterLanguageCode == 'fa') {
      result.add('fa');
      result.add('fa-AE');
      result.add('fa-AF');
      result.add('fa-IR');
    } else if (flutterLanguageCode == 'fi') {
      result.add('fi-FI');
    } else if (flutterLanguageCode == 'fr') {
      result.add('fr-CA');
      result.add('fr-FR');
    } else if (flutterLanguageCode == 'gl') {
      result.add('gl-ES');
    } else if (flutterLanguageCode == 'hi') {
      result.add('hi-IN');
    } else if (flutterLanguageCode == 'hu') {
      result.add('hu-HU');
    } else if (flutterLanguageCode == 'hy') {
      result.add('hy-AM');
    } else if (flutterLanguageCode == 'is') {
      result.add('is-IS');
    } else if (flutterLanguageCode == 'it') {
      result.add('it-IT');
    } else if ((flutterLanguageCode == 'iw') || (flutterLanguageCode == 'he')) {
      result.add('iw-IL');
    } else if (flutterLanguageCode == 'ja') {
      result.add('ja-JP');
    } else if (flutterLanguageCode == 'ka') {
      result.add('ka-GE');
    } else if (flutterLanguageCode == 'km') {
      result.add('km-KH');
    } else if (flutterLanguageCode == 'kn') {
      result.add('kn-IN');
    } else if (flutterLanguageCode == 'ko') {
      result.add('ko-KR');
    } else if (flutterLanguageCode == 'ky') {
      result.add('ky-KG');
    } else if (flutterLanguageCode == 'lo') {
      result.add('lo-LA');
    } else if (flutterLanguageCode == 'mk') {
      result.add('mk-MK');
    } else if (flutterLanguageCode == 'ml') {
      result.add('ml-IN');
    } else if (flutterLanguageCode == 'mn') {
      result.add('mn-MN');
    } else if (flutterLanguageCode == 'mr') {
      result.add('mr-IN');
    } else if (flutterLanguageCode == 'ms') {
      result.add('ms');
      result.add('ms-MY');
      result.add('my-MM');
    } else if (flutterLanguageCode == 'ne') {
      result.add('ne-NP');
    } else if (flutterLanguageCode == 'nl') {
      result.add('nl-NL');
    } else if (flutterLanguageCode == 'no') {
      result.add('no-NO');
    } else if (flutterLanguageCode == 'pl') {
      result.add('pl-PL');
    } else if (flutterLanguageCode == 'pt') {
      result.add('pt-PT');
      result.add('pt-BR');
    } else if (flutterLanguageCode == 'ru') {
      result.add('ru-RU');
    } else if (flutterLanguageCode == 'si') {
      result.add('si-LK');
    } else if (flutterLanguageCode == 'sv') {
      result.add('sv-SE');
    } else if (flutterLanguageCode == 'ta') {
      result.add('ta-IN');
    } else if (flutterLanguageCode == 'te') {
      result.add('te-IN');
    } else if (flutterLanguageCode == 'tr') {
      result.add('tr-TR');
    } else if (flutterLanguageCode == 'zh') {
      result.add('zh-CN');
    } else if (flutterLanguageCode == 'zhb') {
      result.add('zh-HK');
      result.add('zh-TW');
    } else {
      result.add(flutterLanguageCode);
    }

    return result;
  }

  /// 플러터언어코드 -> 앱스토어 언어코드
  List<String> convertFlutterLanguageCodeToAppStoreLanguageCode(
      String flutterLanguageCode) {
    List<String> result = [];

    if (flutterLanguageCode == 'ar') {
      result.add('ar-SA');
    } else if (flutterLanguageCode == 'ca') {
      result.add('ca');
    } else if (flutterLanguageCode == 'cs') {
      result.add('cs');
    } else if (flutterLanguageCode == 'da') {
      result.add('da');
    } else if (flutterLanguageCode == 'de') {
      result.add('de-DE');
    } else if (flutterLanguageCode == 'el') {
      result.add('el');
    } else if (flutterLanguageCode == 'en') {
      result.add('en-AU');
      result.add('en-CA');
      result.add('en-GB');
      result.add('en-US');
    } else if (flutterLanguageCode == 'es') {
      result.add('es-MX');
      result.add('es-ES');
    } else if (flutterLanguageCode == 'fi') {
      result.add('fi');
    } else if (flutterLanguageCode == 'fr') {
      result.add('fr-CA');
      result.add('fr-FR');
    } else if (flutterLanguageCode == 'hi') {
      result.add('hi');
    } else if (flutterLanguageCode == 'hr') {
      result.add('hr');
    } else if (flutterLanguageCode == 'hu') {
      result.add('hu');
    } else if (flutterLanguageCode == 'id') {
      result.add('id');
    } else if (flutterLanguageCode == 'it') {
      result.add('it');
    } else if ((flutterLanguageCode == 'iw') || (flutterLanguageCode == 'he')) {
      result.add('he');
    } else if (flutterLanguageCode == 'ja') {
      result.add('ja');
    } else if (flutterLanguageCode == 'ko') {
      result.add('ko');
    } else if (flutterLanguageCode == 'ms') {
      result.add('ms');
    } else if (flutterLanguageCode == 'nl') {
      result.add('nl-NL');
    } else if (flutterLanguageCode == 'no') {
      result.add('no');
    } else if (flutterLanguageCode == 'pl') {
      result.add('pl');
    } else if (flutterLanguageCode == 'pt') {
      result.add('pt-PT');
      result.add('pt-BR');
    } else if (flutterLanguageCode == 'ro') {
      result.add('ro');
    } else if (flutterLanguageCode == 'ru') {
      result.add('ru');
    } else if (flutterLanguageCode == 'sk') {
      result.add('sk');
    } else if (flutterLanguageCode == 'sv') {
      result.add('sv');
    } else if (flutterLanguageCode == 'th') {
      result.add('th');
    } else if (flutterLanguageCode == 'tr') {
      result.add('tr');
    } else if (flutterLanguageCode == 'uk') {
      result.add('uk');
    } else if (flutterLanguageCode == 'vi') {
      result.add('vi');
    } else if (flutterLanguageCode == 'zh') {
      result.add('zh-Hans');
    } else if (flutterLanguageCode == 'zhb') {
      result.add('zh-Hant');
    }

    return result;
  }
}
