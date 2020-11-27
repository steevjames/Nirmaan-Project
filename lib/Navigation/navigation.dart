import 'package:carbonfootprint/Homepage/homepage.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

// Replace here to change page linked to bottom nav
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Settings',
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
          //  Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          //     boxShadow: [
          //       BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 5),
          //     ],
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(30.0),
          //       topRight: Radius.circular(30.0),
          //     ),
          //     child:

          BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Improve',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(5, 55, 68, 1),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      //   ),
      // ),
    );
  }
}
