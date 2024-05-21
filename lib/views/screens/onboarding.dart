import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/screens/auth_page.dart';
import 'package:news_app/views/screens/profile_page.dart';
import 'package:news_app/views/widgets/main_button.dart';

import '../../main.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});
  State<onboarding> createState() => _onboardingState();
}

@override
class _onboardingState extends State<onboarding> {
  String img = "assets_NewsApp/boarding2.jpg";
  int index = 0;
  String txt1 = "reliable sources";
  String txt2 = "Get the latest news from";

  void change() {
    txt1 = description1[index];
    txt2 = description2[index];
    index++;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 20,
          right: 20, bottom: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0 ,right: 20,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Image.asset('assets_NewsApp/logoLight.png',width: 150,),
                InkWell(
                  child: const Text('Skip',style: TextStyle(
                    fontFamily:'Metropolis thin',
                    fontSize: 15,
                    fontWeight: FontWeight.w800
                  ),),
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>const AuthPage())
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff0c1a31).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(30)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, right: 30, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        txt2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Metropolis extraBold',
                            letterSpacing: 2,
                            fontSize: 40,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        txt1,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Metropolis extraBold',
                            letterSpacing: 2,
                            fontSize: 40),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 70,
                    left: 70,
                    child: MainButton(
                      text: 'Next',
                      onTap: () {
                        if (index == 0) {
                          change();
                          img = "assets_NewsApp/boarding2.jpg";
                        } else if (index == 1) {
                          change();
                          img = "assets_NewsApp/img3.jpg";
                        } else if (index == 2) {
                          change();
                          img = "assets_NewsApp/img9.jpg";
                        } else if (index > 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const
                                  AuthPage()
                               // login()
                              ));
                        }
                      },
                    )
                    ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

List<String> description1 = [
  "reliable sources",
  'all around the world',
  "in NewsGlobe"
];
List<String> description2 = [
  "Get the latest news from",
  "Still up to date news from",
  "From Art to politics, anything"
];
