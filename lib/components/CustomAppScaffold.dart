import 'package:flutter/material.dart';
import 'package:appcours/pages/homePage.dart';
import 'package:appcours/pages/GaleriePage.dart';
import 'package:appcours/pages/ProfilPage.dart';
import 'package:appcours/components/drawer.dart';
import 'package:appcours/components/BottomNavigationBar.dart';
import 'package:appcours/theme/ThemeSwitcher.dart';

class CustomAppScaffold extends StatefulWidget {
  const CustomAppScaffold({super.key});

  @override
  State<CustomAppScaffold> createState() => _CustomAppScaffoldState();
}

class _CustomAppScaffoldState extends State<CustomAppScaffold> {
  int _currentIndex = 0;
  bool _isDarkMode = false;

  final List<Widget> _pages = const [
    HomePage(),
    GaleriePage(),
    ProfilePage(),
  ];

  final List<String> _titles = const [
    'Home',
    'Galerie',
    'Profil',
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index.clamp(0, _pages.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
        final ThemeData currentTheme = _isDarkMode
        ? ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.deepPurple,
              secondary: Colors.deepPurpleAccent,
            ),
          )
        : ThemeData.light(useMaterial3: true).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple,
              secondary: Colors.deepPurpleAccent,
            ),
          );
    return Theme(
      data: currentTheme,
      child: Scaffold(
        drawer: buildDrawer(context, onSelect: (index) {
          _onNavTap(index);
        }),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 113, 104, 104),
          title: Text(
            _titles[_currentIndex],
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            ThemeSwitcher(
              initialDarkMode: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: customBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavTap,
        ),
      ),
    );
  }
}