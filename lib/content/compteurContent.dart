import 'package:flutter/material.dart';

class CompteurContent extends StatefulWidget {
  const CompteurContent({super.key});

  @override
  State<CompteurContent> createState() => _CompteurState();
}

class _CompteurState extends State<CompteurContent> {
  int _count = 0;

  void increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text(
            "Count : $_count",
            style: const TextStyle(fontSize: 32),
          ),
          ElevatedButton(
            onPressed: increment,
            child: const Text('Incrémenter'),
          ),
        ],
      ),
    );
  }
}