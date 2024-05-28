import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../main.dart';
import '../../utilities/profile_listOfMap.dart';
import '../widgets/custom_ListTile.dart';
import 'auth_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
// String?imgLogo='assets_NewsApp/logoLight.png';
class _ProfilePageState extends State<ProfilePage> {

  bool status =MyApp.themeNotifier.value==ThemeMode.dark?false :true ;
  // Color? colorr =Colors.brown;
  void changeMode() {
    setState(() {
      status =MyApp.themeNotifier.value==ThemeMode.dark?false :true ;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings',style: TextStyle(
            fontFamily: 'Metropolis extraBold',
            fontSize: 30
          ),),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: settings.length,
          itemBuilder: (context, index) {
            final item = settings[index];

            if (item.containsKey('divider') && item['divider']) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              );
            } else if (item.containsKey('header') && item['header']) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  item['title'],
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              );
            }

            return CustomListTile(
              icon: item['icon'],
              title: item['title'],
              hasSwitch: item['hasSwitch'],
              switchValue: status?false:true,
              onSwitchChanged: (value) {
                setState(() {
                  status = value;
                  MyApp.themeNotifier.value=
                  MyApp.themeNotifier.value==ThemeMode.light?ThemeMode.dark
                      :ThemeMode.light ;
                  changeMode() ;

                });
              },
              onTap: () async{
                if (item['title'] == 'Logout') {
                  /*as i signed with google , i need also to sign out from it*/
                  GoogleSignIn googleSignIn=GoogleSignIn();
                  googleSignIn.disconnect();
                  /*change only status*/
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthPage())
                  );
                }
              },
            );
          },
        ),

      ),
    );
  }
}
