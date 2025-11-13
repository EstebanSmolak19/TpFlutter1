import 'package:flutter/material.dart';

Widget buildDrawer(BuildContext context, {required Function(int) onSelect}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 113, 104, 104),
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => {
            Navigator.pop(context),
            onSelect(0),
          }
        ),
        ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('Galerie'),
          onTap: () => {
            Navigator.pop(context),
            onSelect(1),
          }
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profil'),
          onTap: () => {
            Navigator.pop(context),
            onSelect(2),
          }
        ),
      ],
    ),
  );
}