import 'package:carbonfootprint/Homepage/homepage.dart';
import 'package:carbonfootprint/Suggestions/improve.dart';
import 'package:carbonfootprint/Leaderboard/leaderboard.dart';
import 'package:carbonfootprint/Settings/settings.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

// Replace here to change pages linked to bottom nav
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SuggestionsPage(),
    Leaderboard(),
    Settings(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Suggestions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Color.fromRGBO(5, 55, 68, 1),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
