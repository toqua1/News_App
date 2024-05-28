import 'package:flutter/material.dart';

final List<Map<String, dynamic>> settings = [
  {'icon': Icons.person, 'title': 'Profile', 'hasSwitch': false},
  {'icon': Icons.logout, 'title': 'Logout', 'hasSwitch': false},
  {'divider': true},
  {'title': 'General Settings', 'header': true},
  {'icon': Icons.bookmark, 'title': 'Bookmarks', 'hasSwitch': false},
  {
    'icon': Icons.dark_mode,
    'title': 'Dark Mode',
    'hasSwitch': true,
    'switchValue': false
  },
  {'icon': Icons.contact_mail, 'title': 'Contact Us', 'hasSwitch': false},
  {'icon': Icons.language, 'title': 'Language', 'hasSwitch': false},
  {'icon': Icons.rate_review, 'title': 'Rate this app', 'hasSwitch': false},
  {'icon': Icons.verified_user, 'title': 'License', 'hasSwitch': false},
  {'icon': Icons.privacy_tip, 'title': 'Privacy Policy', 'hasSwitch': false},
  {'icon': Icons.info, 'title': 'About Us', 'hasSwitch': false},
];