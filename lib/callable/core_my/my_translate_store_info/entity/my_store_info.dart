class MyStoreInfo {

  /// 플레이스토어 정보
  String playStoreTitle = ""; //30자
  String playStoreShortDescription = ""; //80자
  String playStoreFullDescription = '''

'''; //4000자
  String playStoreStartLanguage = "en";
  bool translatePlayStoreName = true;

  /// 앱스토어 정보
  String appStoreTitle = ""; //30자
  String appStoreSubTitle = ""; //30자
  String appStringDescription = '''


'''; //4000자

  String appStoreKeywords = ""; //100자

  String appStoreStartLanguage = "en";
  bool translateAppStoreName = true;
  bool onlyFirstCharacterUpperAppName = true;

  String releaseNote = "fix small bug :)";

  String homepageLink = ""; // 홈페이지 주소
  String policyPageLink = ""; // 개인정보 처리방침 주소

  MyStoreInfo({
    required this.playStoreTitle, //30자
    required this.playStoreShortDescription, //80자
    required this.playStoreFullDescription, //4000자

    required this.playStoreStartLanguage,
    required this.translatePlayStoreName,

    required this.appStoreTitle, //30자
    required this.appStoreSubTitle, //30자
    required this.appStringDescription, //4000자

    required this.appStoreKeywords, //100자

    required this.appStoreStartLanguage,
    required this.translateAppStoreName,
    required this.onlyFirstCharacterUpperAppName,

    required this.releaseNote,

    required this.homepageLink, // 홈페이지 주소
    required this.policyPageLink, // 개인정보 처리방침 주소


  });
}

main() {
  MyStoreInfo myStoreInfo = MyStoreInfo(
    playStoreTitle: "", // 플레이스토어 제목 30자 이내(번역시 타 언어는 더 늘어남)
    playStoreShortDescription: "",  // 플레이스토어 짧은 설명 80자 이내(번역시 타 언어는 더 늘어남)
    playStoreFullDescription: "",  // 플레이스토어 긴 설명 4000자 이내(번역시 타 언어는 더 늘어남)
    playStoreStartLanguage: "en",  // 플레이스토어 번역 시작 언어
    translatePlayStoreName: true, // 플레이스토어 제목 번역 여부
    appStoreTitle: "", // 앱스토어 제목 30자 이내(번역시 타 언어는 더 늘어남)
    appStoreSubTitle: "", // 앱스토어 부제목 30자 이내(번역시 타 언어는 더 늘어남)
    appStringDescription: "", // 앱스토어 설명 4000자 이내(번역시 타 언어는 더 늘어남)

    appStoreKeywords: "", // 앱스토어 키워드 100자 이내(번역시 타 언어는 더 늘어남) , 쉼표로 구분 SEO

    appStoreStartLanguage: "en", // 앱스토어 번역 시작 언어
    translateAppStoreName: true, // 앱스토어 제목 번역 여부
    onlyFirstCharacterUpperAppName: true, // 앱스토어 제목 첫글자만 대문자로 표시 할지 여부

    releaseNote: "fix small bug :)", // 앱스토어 업데이트 노트

    homepageLink: "", // 홈페이지 주소
    policyPageLink: "", // 개인정보 처리방침 주소

  );
}
