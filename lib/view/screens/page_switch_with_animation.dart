import 'package:flutter/material.dart';
import 'package:readky/view/screens/bookmarks_page.dart';
import 'package:readky/view/screens/discover_page.dart';
import 'package:readky/view/screens/home_page.dart';
import 'package:readky/view/widgets/custom_bottom_navigation_bar.dart';

class PageSwitchWithAnimation extends StatefulWidget {
  const PageSwitchWithAnimation({super.key});

  @override
  State<PageSwitchWithAnimation> createState() =>
      _PageSwitchWithAnimationState();
}

class _PageSwitchWithAnimationState extends State<PageSwitchWithAnimation> {
  int _selectedIndex = 0;
  late PageController _pageSwitchController;

  @override
  void initState() {
    super.initState();
    _pageSwitchController = PageController();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageSwitchController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageSwitchController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomePage(),
          DiscoverPage(),
          BookmarkPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
