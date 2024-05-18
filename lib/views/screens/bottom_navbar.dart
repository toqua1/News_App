import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/views/screens/bookmark_page.dart';
import 'package:news_app/views/screens/home_page.dart';
import 'package:news_app/views/screens/profile_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  // int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  PageController pageController=PageController() ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:PageView(
        onPageChanged: (value){
          setState(() {
            // _page=value ;
            _bottomNavigationKey.currentState?.setPage(value);
          });
        },
        controller:pageController ,
        children: const [
          // _buildPage(_page),
          HomePage(),
          BookmarkPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(FontAwesomeIcons.house),
            label: 'Home',
            labelStyle: TextStyle(
                fontFamily: 'Metropolis thin',
                fontWeight: FontWeight.w800,
                fontSize: 12
            )
          ),
          CurvedNavigationBarItem(
            child: Icon(FontAwesomeIcons.solidBookmark),
            label: 'Bookmark',
            labelStyle: TextStyle(
                fontFamily: 'Metropolis thin',
                fontWeight: FontWeight.w800,
                fontSize: 12
            )
          ),
          CurvedNavigationBarItem(
            child: Icon(FontAwesomeIcons.solidUser),
            label: 'Profile',
            labelStyle: TextStyle(
                fontFamily: 'Metropolis thin',
                fontWeight: FontWeight.w800,
                fontSize: 12
            )
          ),
        ],
        color:
        Theme.of(context).colorScheme.onPrimary ,/*for dark mode*/
        // Colors.white,
        buttonBackgroundColor: Colors.redAccent ,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 550),
        onTap: (index) {
          setState(() {
            // _page = index;
            // _buildPage(_page);
            pageController.jumpToPage(index);
          });
        },
        // letIndexChange: (index) => true,
      ),
    );
  }

}

