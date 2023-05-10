import 'package:flutter/material.dart';
import 'package:humming_art/Gallery/gallery_screen.dart';
import 'package:humming_art/adding_cards.dart';
import 'package:humming_art/components/bg_for_screens.dart';
import 'package:humming_art/components/my_bottom_nav_bar.dart';
import 'package:humming_art/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static void onPageChanged(int index) {}
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ProfilePage(),
    const Gallery(),
  ];

  void _navigateBottomBar (int index){
     setState(() {
       _selectedIndex = index;
     });
  }

  @override
  Widget build(BuildContext context) {
    return BGforScreens(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _screens[_selectedIndex],
        bottomNavigationBar: MyBottomNavBar(index: _selectedIndex, context: context, onTap: _navigateBottomBar,),
      ),
    );
  }
}