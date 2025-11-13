import 'package:flutter/material.dart';
import 'package:appcours/pages/homePage.dart';
import 'package:appcours/pages/GaleriePage.dart';
import 'package:appcours/pages/ProfilPage.dart';
import 'package:appcours/components/drawer.dart';
import 'package:appcours/components/BottomNavigationBar.dart';
import 'package:appcours/theme/ThemeSwitcher.dart';

class CustomAppScaffold extends StatefulWidget {
  final Widget? child;
  final bool? initialDarkMode;
  
  const CustomAppScaffold({
    super.key, 
    this.child,
    this.initialDarkMode, 
  });

  @override
  State<CustomAppScaffold> createState() => CustomAppScaffoldState();
}

class CustomAppScaffoldState extends State<CustomAppScaffold> {
  int _currentIndex = 0;
  late bool isDarkMode;

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

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.initialDarkMode ?? false;
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index.clamp(0, _pages.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = isDarkMode
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
        drawer: widget.child == null
            ? buildDrawer(context, onSelect: _onNavTap)
            : null,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 113, 104, 104),
          title: Text(
            widget.child == null ? _titles[_currentIndex] : '',
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            ThemeSwitcher(
              initialDarkMode: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),
        body: widget.child ?? _pages[_currentIndex],
        bottomNavigationBar: widget.child == null
            ? customBottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onNavTap,
              )
            : null,
      ),
    );
  }
}