import 'package:flutter/material.dart';
import 'package:readky/view/screens/bookmarks_page.dart';
import 'package:readky/view/screens/discover_page.dart';
import 'package:readky/view/screens/home_page.dart';
import 'package:readky/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:readky/view/widgets/custom_side_bar.dart';

class PageSwitch extends StatefulWidget {
  const PageSwitch({super.key});

  @override
  State<PageSwitch> createState() => _PageSwitchState();
}

class _PageSwitchState extends State<PageSwitch> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomePage(),
        const DiscoverPage(),
        const BookmarkPage(),
      ][_selectedIndex],
      drawer: const CustomSideBar(),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
