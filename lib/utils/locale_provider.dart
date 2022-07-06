import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local_service.dart';

class LocaleController extends GetxController with LocaleService {
  var selectedLanguage = Get.locale?.languageCode.obs;

  set changeLanguage(String lang) {
    Locale locale = Locale(lang);
    Get.updateLocale(locale);
    removeLocaleCode();
    saveLocaleCode(lang);
    selectedLanguage?.value = lang;
  }

  get getApiLocaleCode {
    String code = getLocaleCode ?? "tk";
    selectedLanguage?.value = code;
    update();
    if (code == "tk") {
      return "tkm";
    } else {
      return code;
    }
  }

  get getLocale {
    String code = getLocaleCode ?? "tk";
    selectedLanguage?.value = code;
    update();
    return Locale(code);
  }
}
