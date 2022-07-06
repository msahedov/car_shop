import 'package:car_shop/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart';

import '../utils/locale_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          titleTextStyle:
              const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          title: 'account'.tr,
          tiles: [
            SettingsTile(
                title: 'phone'.tr,
                subtitle: '+993 64 557576',
                titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                leading: const Icon(Icons.phone)),
            SettingsTile(
                title: 'email'.tr,
                subtitle: 'carshop@gmail.com',
                titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                leading: const Icon(Icons.email)),
            SettingsTile(
                title: 'sign'.tr,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                },
                titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                leading: const Icon(Icons.exit_to_app)),
          ],
        ),

        SettingsSection(
          titleTextStyle:
              const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          title: '',
          tiles: [
            SettingsTile(
              titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              title: 'lang'.tr,
              subtitle: '',
              leading: const Icon(Icons.language),
              onPressed: (context) {
                showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                          title: Text("change".tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1B3DC4),
                                  fontFamily: "Poppins")),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CupertinoDialogAction(
                                child: const Text("Turkmen",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF1B3DC4),
                                        fontFamily: "Poppins")),
                                onPressed: () {
                                  Get.find<LocaleController>().changeLanguage = "tk";
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoDialogAction(
                                child: const Text("English",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF1B3DC4),
                                        fontFamily: "Poppins")),
                                onPressed: () {
                                  Get.find<LocaleController>().changeLanguage = "en";
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                          actions: [],
                        )).whenComplete(() {
                  setState(() {});
                });
              },
            ),
            // CustomTile(
            //   child: Container(
            //     color: Color(0xFFEFEFF4),
            //     padding: EdgeInsetsDirectional.only(
            //       start: 14,
            //       top: 12,
            //       bottom: 30,
            //       end: 14,
            //     ),
            //     child: Text(
            //       'You can setup the language you want',
            //       style: TextStyle(
            //         color: Colors.grey.shade700,
            //         fontWeight: FontWeight.w400,
            //         fontSize: 13.5,
            //         letterSpacing: -0.5,
            //       ),
            //     ),
            //   ),
            // ),
            // // SettingsTile(
            //   title: 'Environment',
            //   subtitle: 'Production',
            //   leading: Icon(Icons.cloud_queue),
            // ),
          ],
        ),

        // SettingsSection(
        //   title: 'Security',
        //   tiles: [
        //     SettingsTile.switchTile(
        //       title: 'Lock app in background',
        //       leading: Icon(Icons.phonelink_lock),
        //       switchValue: lockInBackground,
        //       onToggle: (bool value) {
        //         setState(() {
        //           lockInBackground = value;
        //           notificationsEnabled = value;
        //         });
        //       },
        //     ),
        //     SettingsTile.switchTile(
        //       title: 'Use fingerprint',
        //       subtitle: 'Allow application to access stored fingerprint IDs.',
        //       leading: Icon(Icons.fingerprint),
        //       onToggle: (bool value) {},
        //       switchValue: false,
        //     ),
        //     SettingsTile.switchTile(
        //       title: 'Change password',
        //       leading: Icon(Icons.lock),
        //       switchValue: true,
        //       onToggle: (bool value) {},
        //     ),
        //     SettingsTile.switchTile(
        //       title: 'Enable Notifications',
        //       enabled: notificationsEnabled,
        //       leading: Icon(Icons.notifications_active),
        //       switchValue: true,
        //       onToggle: (value) {},
        //     ),
        //   ],
        // ),

        SettingsSection(
          titleTextStyle:
              const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          title: '',
          tiles: [
            SettingsTile(
                onPressed: (context) {
                  showAboutDialog(context: context);
                },
                title: 'terms'.tr,
                titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                leading: const Icon(Icons.description)),
            SettingsTile(
                onPressed: (context) {
                  showLicensePage(context: context);
                },
                title: 'lisence'.tr,
                titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                leading: const Icon(Icons.collections_bookmark)),
          ],
        ),
        CustomSection(
          child: const Text(
            '\nVersion: 1.0.0 ',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF777777)),
          ),
        ),
      ],
    );
  }
}
