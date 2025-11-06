import 'package:flutter/material.dart';

Widget customBottomNavigationBar({required int currentIndex, required Function(int) onTap,}) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: onTap,
    selectedItemColor: Colors.deepPurple,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.monochrome_photos),
        label: 'Galerie',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profil',
      ),
    ],
  );
}