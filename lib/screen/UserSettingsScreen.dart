import 'package:flutter/material.dart';
import 'package:flutter_online_book_store/utils/utility.dart';
import 'package:settings_ui/settings_ui.dart';

class UserSettingsScreen extends StatefulWidget {
  UserSettingsScreen({Key? key}) : super(key: key);

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool isSwitched = false,
      isLockApp = true,
      isFingerPrintEnabled = false,
      isChangePass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("User Settings"),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            titlePadding: EdgeInsets.all(20),
            title: 'Common',
            titleTextStyle:
                TextStyle(color: primary, fontWeight: FontWeight.bold),
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Use System Theme',
                leading: Icon(Icons.phone_android),
                switchValue: isSwitched,
                onToggle: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            titlePadding: EdgeInsets.all(20),
            title: 'Account',
            titleTextStyle:
                TextStyle(color: primary, fontWeight: FontWeight.bold),
            tiles: [
              SettingsTile(
                title: 'Phone number',
                leading: Icon(Icons.phone),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Email',
                leading: Icon(Icons.email),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Sign out',
                leading: Icon(Icons.logout),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
          SettingsSection(
            titlePadding: EdgeInsets.all(20),
            title: 'Security',
            titleTextStyle:
                TextStyle(color: primary, fontWeight: FontWeight.bold),
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock_sharp),
                switchValue: isLockApp,
                onToggle: (value) {
                  setState(() {
                    isLockApp = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  switchValue: isFingerPrintEnabled,
                  onToggle: (value) {
                    setState(() {
                      isFingerPrintEnabled = value;
                    });
                  }),
              SettingsTile.switchTile(
                  title: 'Change Password',
                  leading: Icon(Icons.lock_rounded),
                  switchValue: isChangePass,
                  onToggle: (value) {
                    setState(() {
                      isChangePass = value;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
