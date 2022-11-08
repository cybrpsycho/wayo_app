import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  final _destinations = ['home', 'search', 'discover', 'saved', 'menu'];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
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
        onTap: (value) => setState(() {
          if (_selectedIndex == value) return;
          _selectedIndex = value;
          context.goNamed(_destinations[value]);
        }),
      ),
    );
  }
}
