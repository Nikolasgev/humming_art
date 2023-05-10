import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {

  const MyBottomNavBar({
    super.key, 
    required this.index,
    required this.context,
    required this.onTap 
  });

  final BuildContext context;
  final int index;
  final void Function(int)? onTap;

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: widget.index,
      backgroundColor: Colors.transparent,
      color: const Color.fromARGB(255, 36, 27, 17),
      animationDuration: const Duration(milliseconds: 300),
      onTap: widget.onTap,
      items: const [
        Icon(Icons.person),
        Icon(Icons.image),
      ]
    );
  }
}