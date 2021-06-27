import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreen createState() => _RootScreen();
}

class _RootScreen extends State<RootScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (i) {
          setState(() => _currentIndex = i);
          _pageController.jumpToPage(i);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Characters'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.location_city),
            title: Text('Locations'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.tv),
            title: Text('Episodes'),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (i) {
            setState(() => _currentIndex = i);
          },
          children: [
            Container(
              child: Text('CHARACTERS'),
            ),
            Container(
              child: Text('LOCATIONS'),
            ),
            Container(
              child: Text('EPISODES'),
            ),
          ],
        ),
      ),
    );
  }
}
