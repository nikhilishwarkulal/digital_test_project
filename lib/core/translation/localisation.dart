import 'package:digitaltestproject/common/i18n/en.dart';

///[getTranslated] localisation is not implemented
///Update this function to get the locale and return string based on locale.
String getTranslated(String key) {
  return i18nEn[key] ?? key;
}
