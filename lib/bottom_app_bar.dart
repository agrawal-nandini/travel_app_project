import 'package:flutter/material.dart';

class bottomappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Color(0xFFF7FFF7),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'to-do list',
            backgroundColor: Color(0xFFF7FFF7),
          ),
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Color(0xFFFFB49A),
        unselectedItemColor: Colors.grey,
        iconSize: 25,
        elevation: 5);
  }
}
