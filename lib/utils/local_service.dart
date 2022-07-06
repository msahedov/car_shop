import 'package:get_storage/get_storage.dart';

mixin LocaleService {
  Future<bool> saveLocaleCode(String? code) async {
    final box = GetStorage();
    await box.write("locale", code ?? "tk");
    return true;
  }

  String? get getLocaleCode {
    final box = GetStorage();
    return box.read("locale");
  }

  Future<void> removeLocaleCode() async {
    final box = GetStorage();

    await box.remove("locale");
  }
}
