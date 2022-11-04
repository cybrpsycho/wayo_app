import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class GenericBottomNav extends StatefulWidget {
  const GenericBottomNav({super.key});

  @override
  State<GenericBottomNav> createState() => _GenericBottomNavState();
}

class _GenericBottomNavState extends State<GenericBottomNav> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.compass),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
      ),
    );
  }
}
