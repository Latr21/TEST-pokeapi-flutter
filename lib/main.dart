import 'package:flutter/material.dart';
import 'package:pokeapi/acceuile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeAPI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageAccueil(),
    );
  }
}
