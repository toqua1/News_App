import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/screens/bottom_navbar.dart';
import 'onboarding.dart';
import 'package:lottie/lottie.dart';

class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 6),
            ()=> Navigator.push(context,
            MaterialPageRoute(builder: (context)=>
            FirebaseAuth.instance.currentUser != null?
            const BottomNavbar():
            const onboarding())
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff62111e),
      body: Stack(
        children: [
          Lottie.network(
              'https://lottie.host/2cdaca9a-95d8-4eaf-9be0-7e28d7d8c8af/jj2AmHG3t7.json',
              fit: BoxFit.cover ,height: 300),
          Container(
            width: 1000,
            height: 2000,
            color: Colors.black.withOpacity(0.1),
          ),
          Center(child: Lottie.asset('assets_NewsApp/gif1.json' ,
              width: 300
          )),
        ],
      ), // ],
      // ),
    );
  }
}
