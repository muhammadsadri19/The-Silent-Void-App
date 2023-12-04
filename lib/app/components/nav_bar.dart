import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:the_silent_void/app/modules/bug/bug_page.dart';
import 'package:the_silent_void/app/modules/id%20card/idcard_page.dart';
import 'package:the_silent_void/app/modules/profile/profile_page.dart';
import 'package:the_silent_void/app/modules/uu%20member/uumember_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    UUMemberWidget(),
    IdcardPage(),
    ProfilePage(),
    BugPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff353545),
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xFF161A30),
        color: Colors.white,
        activeColor: Colors.orange,
        gap: 8,
        tabs: [
          GButton(
              icon: Icons.book,
              text: 'UU MEMBER',
              textStyle: TextStyle(
                  fontFamily: 'ShareTech',
                  color: Colors.orange,
                  fontWeight: FontWeight.bold)),
          GButton(
              icon: Icons.document_scanner,
              text: 'ID CARD',
              textStyle: TextStyle(
                  fontFamily: 'ShareTech',
                  color: Colors.orange,
                  fontWeight: FontWeight.bold)),
          GButton(
              icon: Icons.fingerprint,
              text: 'PROFILE',
              textStyle: TextStyle(
                  fontFamily: 'ShareTech',
                  color: Colors.orange,
                  fontWeight: FontWeight.bold)),
          GButton(
              icon: Icons.bug_report,
              text: 'BUGS',
              textStyle: TextStyle(
                  fontFamily: 'ShareTech',
                  color: Colors.orange,
                  fontWeight: FontWeight.bold)),
        ],
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
      ),
    );
  }
}
