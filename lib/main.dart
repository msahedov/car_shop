import 'package:car_shop/constants/constants.dart';
import 'package:car_shop/screens/home_page.dart';
import 'package:car_shop/utils/locale_provider.dart';
import 'package:car_shop/utils/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put<LocaleController>(LocaleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.find<LocaleController>().getLocale,
      translations: LocaleString(),
      title: 'Car Shop',
      theme: ThemeData(
        fontFamily: "BellotaText",
        accentColor: priamryColor_1,
      ),
      home: MyHomePage(title: 'Car Shop'),
    );
  }
}
