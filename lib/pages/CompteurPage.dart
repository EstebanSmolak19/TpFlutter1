import 'package:appcours/content/compteurContent.dart';
import 'package:flutter/material.dart';

class CompteurPage extends StatelessWidget {
  const CompteurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CompteurContent() 
    );
  }
}