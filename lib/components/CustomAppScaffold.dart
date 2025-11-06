import 'package:appcours/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:appcours/components/drawer.dart';
import 'package:appcours/components/BottomNavigationBar.dart';
import 'package:appcours/pages/GaleriePage.dart';
import 'package:appcours/pages/ProfilPage.dart';

class CustomAppScaffold extends StatefulWidget {
  const CustomAppScaffold({super.key});

  @override
  State<CustomAppScaffold> createState() => _CustomAppScaffoldState();
}

class _CustomAppScaffoldState extends State<CustomAppScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    GaleriePage(),
    ProfilePage(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context, onSelect: (index) {
        _onNavTap(index); 
        Navigator.pop(context); 
      }),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 113, 104, 104),
        title: Text(
          ['Home', 'Galerie', 'Profil'][_currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: customBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}