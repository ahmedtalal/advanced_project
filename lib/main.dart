import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/presentation/screens/home.dart';

void main() {
  runApp(BreakingFilmApp());
}

class BreakingFilmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
