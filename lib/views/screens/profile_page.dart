import 'package:flutter/material.dart';
import '../../utilities/profile_listOfMap.dart';
import '../widgets/custom_ListTile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;
  bool getNotifications = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final item = settings[index];

          if (item.containsKey('divider') && item['divider']) {
            return const Divider();
          } else if (item.containsKey('header') && item['header']) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item['title'],
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            );
          }

          return CustomListTile(
            icon: item['icon'],
            title: item['title'],
            hasSwitch: item['hasSwitch'],
            switchValue: item.containsKey('switchValue')
                ? item['title'] == 'Dark Mode'
                ? isDarkMode
                : getNotifications
                : false,
            onSwitchChanged: (value) {
              setState(() {
                if (item['title'] == 'Dark Mode') {
                  isDarkMode = value;
                } else if (item['title'] == 'Get Notifications') {
                  getNotifications = value;
                }
              });
            },
          );
        },
      ),

    );
  }
}
