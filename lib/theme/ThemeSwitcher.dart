import 'package:flutter/material.dart';

class ThemeSwitcher extends StatefulWidget {
  final bool initialDarkMode;
  final ValueChanged<bool> onChanged;

  const ThemeSwitcher({
    super.key,
    required this.initialDarkMode,
    required this.onChanged,
  });

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialDarkMode;
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    widget.onChanged(_isDarkMode); // informe le parent du changement
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: _toggleTheme,
      tooltip: 'Switch Theme',
    );
  }
}