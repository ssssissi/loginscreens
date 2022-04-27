import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart';
import 'package:untitled/login.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool lockInBackground = true;
  bool darkMode= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(title: const Text('Settings'),
      backgroundColor: const Color(0xff051b47)),
      body:Column(
    children: [
      const SizedBox(height: 30),
      SettingsList(
      shrinkWrap: true,
        lightBackgroundColor: Colors.cyan.shade100,
        darkBackgroundColor: const Color(0xff051b47),
        sections: [
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(title: 'Phone number', leading: const Icon(Icons.phone, color: Color(0xff051b47),)),
              SettingsTile(title: 'Email', leading: const Icon(Icons.email, color: Color(0xff051b47),)),
            ],
          ),
          SettingsSection(
            title: 'Secutiry',
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: const Icon(Icons.phonelink_lock, color: Color(0xff051b47),),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
              ),
              SettingsTile(title: 'Change Password', leading: const Icon(Icons.key, color: Color(0xff051b47),)),
            ],
          ),
        ],
      ),
      const SizedBox(height: 150),
      ElevatedButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyLogin()));
          },
          style: ElevatedButton.styleFrom(
              primary: const Color(0xff051b47),
              fixedSize: const Size(120, 60),
              side: const BorderSide(width: 1.5, color: Color(0xff051b47)),
              textStyle: const TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              ),
          child: const Text("Log out",textAlign: TextAlign.center)),
      ],
      ),
    );
  }
}
